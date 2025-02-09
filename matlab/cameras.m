% Auto-generated by stereoCalibrator app on 27-Jan-2025
%-------------------------------------------------------


% Define images to process
imageFileNames1 = {'C:\GitHub\Tennis-Tracker\matlab\images\left\imageL0.png',...
    'C:\GitHub\Tennis-Tracker\matlab\images\left\imageL1.png',...
    'C:\GitHub\Tennis-Tracker\matlab\images\left\imageL2.png',...
    'C:\GitHub\Tennis-Tracker\matlab\images\left\imageL3.png',...
    'C:\GitHub\Tennis-Tracker\matlab\images\left\imageL4.png',...
    'C:\GitHub\Tennis-Tracker\matlab\images\left\imageL5.png',...
    };
imageFileNames2 = {'C:\GitHub\Tennis-Tracker\matlab\images\right\imageR0.png',...
    'C:\GitHub\Tennis-Tracker\matlab\images\right\imageR1.png',...
    'C:\GitHub\Tennis-Tracker\matlab\images\right\imageR2.png',...
    'C:\GitHub\Tennis-Tracker\matlab\images\right\imageR3.png',...
    'C:\GitHub\Tennis-Tracker\matlab\images\right\imageR4.png',...
    'C:\GitHub\Tennis-Tracker\matlab\images\right\imageR5.png',...
    };

% Detect calibration pattern in images
detector = vision.calibration.stereo.CheckerboardDetector();
minCornerMetric = 0.150000;
[imagePoints, imagesUsed] = detectPatternPoints(detector, imageFileNames1, imageFileNames2, 'MinCornerMetric', minCornerMetric);

% Generate world coordinates for the planar pattern keypoints
squareSize = 20.000000;  % in millimeters
worldPoints = generateWorldPoints(detector, 'SquareSize', squareSize);

% Read one of the images from the first stereo pair
I1 = imread(imageFileNames1{1});
[mrows, ncols, ~] = size(I1);

% Calibrate the camera
[stereoParams, pairsUsed, estimationErrors] = estimateCameraParameters(imagePoints, worldPoints, ...
    'EstimateSkew', false, 'EstimateTangentialDistortion', false, ...
    'NumRadialDistortionCoefficients', 2, 'WorldUnits', 'millimeters', ...
    'InitialIntrinsicMatrix', [], 'InitialRadialDistortion', [], ...
    'ImageSize', [mrows, ncols]);

% View reprojection errors
h1=figure; showReprojectionErrors(stereoParams);

% Visualize pattern locations
h2=figure; showExtrinsics(stereoParams, 'CameraCentric');

% Display parameter estimation errors
displayErrors(estimationErrors, stereoParams);

% You can use the calibration data to rectify stereo images.
I2 = imread(imageFileNames2{1});
[J1, J2, reprojectionMatrix] = rectifyStereoImages(I1, I2, stereoParams);

% See additional examples of how to use the calibration data.  At the prompt type:
% showdemo('StereoCalibrationAndSceneReconstructionExample')
% showdemo('DepthEstimationFromStereoVideoExample')
