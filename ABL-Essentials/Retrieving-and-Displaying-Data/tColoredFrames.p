
/*------------------------------------------------------------------------
    File        : tColoredFrames
    Purpose     : Display 10 frames with different text, titles, and colors with a pause between each.
    Description : Create 10 frames, named f1-f10
                  Each frame has a title which includes its frame number, such as “Frame 1”.
                  The background color of each frame matches its number. For example, frame #1 has a background color of 1.
                  The displayed text includes the frame number. For example, frame #1 might display the text “Color #1”.
                  Frames number 6 – 10 are centered.
                  Display all 10 frames, with a pause between each display.
    Author(s)   : Jade Neeley
  ----------------------------------------------------------------------*/

define frame f1  with title "Color 1" with bgcolor 1.
define frame f2  with title "Color 2" with bgcolor 2.
define frame f3  with title "Color 3" with bgcolor 3.
define frame f4  with title "Color 4" with bgcolor 4.
define frame f5  with title "Color 5" with bgcolor 5.
define frame f6 with centered with title "Color 6" with bgcolor 6.
define frame f7 with centered with title "Color 7" with bgcolor 7.
define frame f8 with centered with title "Color 8" with bgcolor 8.
define frame f9 with centered with title "Color 9" with bgcolor 9.
define frame f10 with centered with title "Color 10" with bgcolor 10.

display "Color #1" with frame f1.
pause.
display "Color #2" with frame f2.
pause.
display "Color #3" with frame f3.
pause.
display "Color #4" with frame f4.
pause.
display "Color #5" with frame f5.
pause.
display "Color #6" with frame f6.
pause.
display "Color #7" with frame f7.
pause.
display "Color #8" with frame f8.
pause.
display "Color #9" with frame f9.
pause.
display "Color #10" with frame f10.
