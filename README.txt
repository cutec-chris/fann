FANN Delphi Binding
===================

These files are distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

Author: Mauricio Pereira Maia <mauriciocpa@gmail.com>
Version: 2.0


VERSION HISTORY
===============

Version 1.0 - 10 Oct 2004 - First Version released.
Version 1.1 - 12 Nov 2004 - Fixed LoadFromFile bug.
Version 2.0 - 15 Nov 2007 - Added support for Fann 2.1.0


REQUERIMENTS
============

- Delphi 6 or above. Prior Delphi versions should work too, but without the functions 
fann_create_shortcut, fann_create_sparse and fann_create_standard because the 
variable argument functions are not supported by previous versions of Delphi.)


HOW TO USE IT
=============

- Put the file fannfloat.dll in your PATH. (If you want to use fannfixed.dll or 
fanndouble.dll you should change the definitions at the beginning of the fann.pas unit)
- Include fann.pas in your project and in your unit uses clause, and have fun!
- See the XorConsole sample for more details.


INSTALLING THE TFannNetwork Component
=====================================

TFannNetwork is a Delphi component that encapsulates the Fann Library.
You do not have to install TFannNetwork to use Fann on Delphi, 
but it will make the library more Delphi friendly.

To install TFannNetwork you should follow all the previous steps and
- Copy the FannNetwork.pas and Fann.dcr to your Delphi Library PATH.
- Choose Component/Install Component.
- In the Unit file name field, click on Browse and point to the fannnetwork.pas file.
By default Delphi will install in the Borland User Components package, 
it might be changed using Package file name field or Into new package page.
- Click on Ok 
- A confirmation dialog will be shown asking if you want to build the package. Click on Yes.
- You have just installed TFannNetwork, now close the package window 
(Don't forget to put Yes when it ask if you want to save the package). 
- See the FannNetwork.pas file or the XorTFannNetwork Sample.



























