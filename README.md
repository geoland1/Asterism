# Asterism

Image reduction / pre-processing

Asterism is a Linux image data reduction preprocessing utility, written in Bash. Mainly, with amateur astronomical RAW image data in mind. Not to restrict its application, Asterism may be used to process macro and microscopy images. 

Asterism uses image manipulation programs common to most Linux distributions and various third party scripts to create a processing pipeline. Yad DCRAW ImageMagick and Panotools must be installed - Hugin and Macrofusion are optional - libtiff should be installed on most systems and gksu and kdesudo are required for system install (/usr/local/bin).

Note: presently, for full functionality, run from the Asterism folder in a terminal with ./asterism - alternatively bash -x ./asterism.

Primarily intented for RAW image data acquired with consumer digital cameras, Asterism handles fits tiff png jpeg and many other image formats. 

A user manual is available at http://synergous.com/txtpat/files/asterism_user_manual_new.html
RAW files are available to download from Dropbox to experiment with Asterism - three of each, bias dark, flat and light frames, ~10mb each.
https://www.dropbox.com/sh/x9lyinxoaq0i62t/AADUuHgeogxYJOr5hnot1Njca?dl=0

Note: Summarising - Asterism performs master calibration frame creation, as well as, bias dark and flat frame image reduction, deBayering, image aligment and stacking. There are various modes and processing pathways for cooled cameras and stock standard consumer digital cameras, including the colour boost application of manufacturer RGB image matrix multipliers. Optional, noise reduction methods make use of the ImageMagick min max pixel value / within quantum range routine, the -mean-shift process and indirectly, polynomial image stacking.
