# Asterism

Image reduction / pre-processing

Version 0.1.3.5 onwards - simplified set-up - no installation or run from terminal required - see documentation.

Note: it may be necessary to do $chmod +x RUN in a terminal in the Asterism-master folder.

Asterism is a Linux image data reduction preprocessing utility, written in Bash. Mainly, with amateur astronomical RAW image data in mind. Not to restrict its application, Asterism may be used to process macro and microscopy images. 

Asterism uses image manipulation programs common to most Linux distributions and various third party scripts to create a processing pipeline. Yad DCRAW ImageMagick and hugin-tools must be installed - Hugin and Macrofusion are optional - libtiff should be installed on most systems.

Primarily intented for RAW image data acquired with consumer digital cameras, Asterism handles fits tiff png jpeg and many other image formats.

Note: Summarising - Asterism creates master calibration frames and performs bias dark and flat frame image reduction, deBayering, image aligment and stacking. There are various modes and processing pathways for cooled cameras and stock standard consumer digital cameras, including the colour boost application of manufacturer RGB image matrix multipliers. Optional, noise reduction methods make use of the ImageMagick min max pixel value / within quantum range routine, the -mean-shift process and indirectly, polynomial image stacking.
