 # MATLAB OCR script for storing measured data from HP_4284 impedance analyzser

 ## DESCRIPTION:
 The function takes a screenshot of a webcam filming the display of
       the Impedance analyser, crops the image to the ROI and uses OCR to
       store the impedance in a variable.
       This function is optimized for impedance measurement but can be
       modified for any other measurement. It only recognises the
       characters: '0123456789.kMQ-' and must be trained with the 
       ocrTrainer to recognise other characters.

The function also recognised the exponent of the unit (e.g. Kilo, Mega...)
       Here only Kilo and Mega is implemented, for more the if statement must be
       extended and the character must be trained with the ocrTrainer to 
       be recognised by the script.

 ## IMPORTANT NOTE:
For best results the display should not reflect (e.g. cover it from
       direct light) and no dirt must be on the screen
       If returned values are wrong/empty check if the image can be 
       correctly recognized -> visit:  [Matlab website](https://uk.mathworks.com/help/vision/examples/recognize-text-using-optical-character-recognition-ocr.html)
	  
The Image might be mirrored, which must be adjusted manually
       (uncomment the line you need)
       Depending on the webcam, the OCR maybe need new calibration with
       the ocrTrainer command

 ## INPUTS:
- webcam: A webcam which is opened in MATLAB and filming the display
- x1, y1: Upper left corner of ROI
- x2, y2: Down right corner of ROI
        
 ## OUTPUTS:
- impedance: The measured impedance

 ## FILE DEPENDENCIES:
- tessdata/HP_4284A.traineddata: This is the language file which stores the calibration for the screen font

 ## AUTHOR:
- Linus Reitmayr, University College London, 2017  
