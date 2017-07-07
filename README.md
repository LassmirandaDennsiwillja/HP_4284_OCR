 readImpedance: Return the impedance measured by the HP_4284 impedance
 analyzser

 DESCRIPTION:
       The function takes a screenshot of a webcam filming the display of
       the Impedance analyser, crops the image to the ROI and uses OCR to
       calculate the impedance.
       This function is optimized for impedance measurement but can be
       modified for any other measuremimshent. It only recognises the
       characters: '0123456789.kMQ-' and must be trained with the 
       ocrTrainer to recognise other characters

 IMPORTANT NOTE:
       For best results the display should not reflect (e.g. cover it from
       direct light)
       If returned values are from/empty check if the image can be 
       correctly recognized -> visit: https://uk.mathworks.com/help/vision/examples/recognize-text-using-optical-character-recognition-ocr.html
	   
       The Image might be mirrored, which must be adjusted manually
       (uncomment the line you need)
       Depending on the webcam, the OCR maybe need new calibration with
       ocrTrainer

 INPUTS:
       webcam: A webcam which is opened in MATLAB and filing the display
       x1, y1: Upper left corner of ROI
       x2, y2: Down right corner of ROI
        
 OUTPUTS:
       impedance: The measured impedance

 FILE DEPENDENCIES:
       tessdata/HP_4284A.traineddata: This is the language file which
       stores the calibration for the screen font

 AUTHOR:
       Linus Reitmayr, University College London, 2017  
