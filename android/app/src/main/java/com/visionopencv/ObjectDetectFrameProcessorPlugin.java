package com.visionopencv;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import com.mrousavy.camera.frameprocessor.Frame;
import com.mrousavy.camera.frameprocessor.FrameProcessorPlugin;
import com.mrousavy.camera.frameprocessor.VisionCameraProxy;
import java.util.Map;
import org.opencv.core.Mat;

public class ObjectDetectFrameProcessorPlugin extends FrameProcessorPlugin {
  public ObjectDetectFrameProcessorPlugin(@NonNull VisionCameraProxy proxy, @Nullable Map<String, Object> options) {
    super();
  }

  @Nullable
  @Override
  public Object callback(@NonNull Frame frame, @Nullable Map<String, Object> arguments) {
    Mat mat = OpenCV.imageToMat(frame);
    return OpenCV.findObjects(mat);
  }
}