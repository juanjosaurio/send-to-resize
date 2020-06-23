# send-to-resize

## Introduction
More than once I've found myself opening Gimp just to resize an image, usually a screen capture, to a more e-mail or phone friendly size.
More than once I've also found myself wishing to be able to do it in an easier way.

The (self-imposed) restrictions are:

* It has to work in Windows 10 (current working environment)
* It has to use Cygwin
* It has to use Image Magick

I remembered having made something like this some years ago but for merging PDF files, but didn't have the code nor the setup instructions and also remembered that the folders and the file names couldn't have spaces for the script to work.

This time I was determined to make it work with spaces, and multiple files.

Then the fight started.

Finding a way to receive and properly diferentiate every argument was a pain, but it worked in the end.

## Setup Instructions

### Script Installation

Supposing you already have Cygwin installed and working, you can clone this repo or download just the script. For the sake of this instruction, we are going to say that the script is in ``/home/user/folder/resize.sh``

Remember to ``chmod 755 /home/user/folder/resize.sh``

### Send To Configuration

``[Win]+R shell:sendto`` to open the windows folder where the _Send To_ shortcuts live.

Create a new one called _Shrink_ with the following target:
``C:\cygwin64\bin\bash.exe -c "source /home/user/folder/resize.sh" %*``

## Using it

Right button on an image and you should select Send To and then _Shrink_ and the magic[1] should happen.

[1]: The magic would look like a black command screen.