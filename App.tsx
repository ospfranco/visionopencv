import React, {useEffect} from 'react';
import {StyleSheet, useWindowDimensions} from 'react-native';
import 'react-native-reanimated';
import Animated, {
  useAnimatedStyle,
  useSharedValue,
} from 'react-native-reanimated';
import {
  Camera,
  VisionCameraProxy,
  useCameraDevice,
  useFrameProcessor,
} from 'react-native-vision-camera';
import {Worklets} from 'react-native-worklets-core';

const plugin = VisionCameraProxy.initFrameProcessorPlugin('objectDetect');

function objectDetect(frame: any): any {
  'worklet';
  if (plugin == null) {
    throw new Error('Failed to load Frame Processor Plugin "objectDetect"!');
  }
  return plugin.call(frame);
}

function App() {
  const flag = useSharedValue({height: 20, left: 30, top: 30, width: 20});
  const updateSharedValue = Worklets.createRunInJsFn((v: any) => {
    flag.value = v;
  });

  const flagOverlayStyle = useAnimatedStyle(
    () => ({
      backgroundColor: 'green',
      position: 'absolute',
      ...flag.value,
    }),
    [flag],
  );

  const dimensions = useWindowDimensions();

  const frameProcessor = useFrameProcessor(frame => {
    'worklet';
    const rectangle = objectDetect(frame);

    const xFactor = dimensions.width / frame.width;
    const yFactor = dimensions.height / frame.height;

    if (rectangle && rectangle.x) {
      updateSharedValue({
        height: rectangle.height * yFactor,
        left: rectangle.x * xFactor,
        top: rectangle.y * yFactor,
        width: rectangle.width * xFactor,
      });
    } else {
      updateSharedValue({height: 0, left: 0, top: 0, width: 0});
    }
  }, []);

  const device = useCameraDevice('back');

  useEffect(() => {
    const checkPermissions = async () => {
      await Camera.requestCameraPermission();
    };
    checkPermissions();
  }, []);

  if (device == null) {
    return null;
  }

  return (
    <>
      <Camera
        frameProcessor={frameProcessor}
        style={StyleSheet.absoluteFill}
        device={device}
        isActive={true}
        orientation="portrait"
      />
      <Animated.View style={flagOverlayStyle} />
    </>
  );
}

export default App;
