function [ impedance ] = readImpedance(webcam,y1,y2,x1,x2)
% readImpedance: Return the impedance measured by the HP_4284 impedance
% analyzser
%
% DESCRIPTION:
%       The function takes a screenshot of a webcam filming the display of
%       the Impedance analyser, crops the image to the ROI and uses OCR to
%       calculate the impedance.
%       This function is optimized for impedance measurement but can be
%       modified for any other measuremimshent. It only recognises the
%       characters: '0123456789.kMQ-' and must be trained with the 
%       ocrTrainer to recognise other characters
%
% IMPORTANT NOTE:
%       For best results the display should not reflect (e.g. cover it from
%       direct light)
%       If returned values are from/empty check if the image can be 
%       correctly recognized -> visit: https://uk.mathworks.com/help/vision/examples/recognize-text-using-optical-character-recognition-ocr.html 
%       The Image might be mirrored, which must be adjusted manually
%       (uncomment the line you need)
%       Depending on the webcam, the OCR maybe need new calibration with
%       ocrTrainer
%
% INPUTS:
%       webcam: A webcam which is opened in MATLAB and filing the display
%       x1, y1: Upper left corner of ROI
%       x2, y2: Down right corner of ROI
%        
% OUTPUTS:
%       impedance: The measured impedance
%
% FILE DEPENDENCIES:
%       tessdata/HP_4284A.traineddata: This is the language file which
%       stores the calibration for the screen font
%
% AUTHOR:
%       Linus Reitmayr, University College London, 2017    



    %Uncomment needed line, depending on the camera orientation
    %I = webcam.snapshot;
    %I = flip(webcam.snapshot,1);
    %I = flip(webcam.snapshot,2);
    I = flip(flip(webcam.snapshot,1),2);
    %I = flip(flip(webcam.snapshot,2),1);

    I2 = rgb2gray(I(y1:y2,x1:x2,:));
    
    %For debug
    %BW = imbinarize(I2);
    %imshowpair(I2, BW, 'montage');
    %imshow(BW);
    %imshow(I2);
    
    results = ocr(I2, 'CharacterSet', '0123456789.kMQ-', 'TextLayout','Block','Language','./HP_4284A/tessdata/HP_4284A_good_cam.traineddata');

    text = results.Text;
    text(ismember(text,' '))=[];
    text=textscan(text,'%f%s');
    impedance = text{1};
    unit = text{2};
    
%     if contains(unit(1,:),'k')==1
%         impedance(1) = impedance(1)*1e3;
%     elseif contains(unit(1,:),'M')==1
%         impedance(1) = impedance(1)*1e6;
%     end
% 
%     if contains(unit(2,:),'k')==1
%         impedance(2) = impedance(2)*1e3;
%     elseif contains(unit(2,:),'M')==1
%         impedance(2) = impedance(2)*1e6;
%     end
    
end