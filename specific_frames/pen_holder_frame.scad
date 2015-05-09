include <specific_frame_def.scad>

include <../frames/frame_def.scad>
include <../dynamixel/xl320_def.scad>
include <../ollo_segments/ollo_segments_def.scad>

use <../frames/U_three_ollo_frame.scad>
use <../ollo_segments/ollo_straight_segment.scad>

use <../../segment-scad/elliptic_segment.scad>

use <../../MCAD/rotate.scad>;

module pen_holder_frame(length=OlloSpacing/2+ollo_segment_thickness(1), innerDiameter=PenHolderInnerDiameter){

  U_three_ollo_frame(length);

  rotate([90,0,0])
    translate([0,-OlloSegmentWidth/2,-innerDiameter/2-length])
      elliptic_segment(OlloSegmentWidth, width=innerDiameter+2*ollo_segment_thickness(1), heigth=innerDiameter+2*ollo_segment_thickness(1), wallThickness=ollo_segment_thickness(1));
}


// Testing
echo("##########");
echo("In pen_holder_frame.scad");
echo("This file should not be included, use ''use <filemane>'' instead.");
echo("##########");

use <../dynamixel/xl320.scad>

p = 1;
if (p==1) {
  xl320();
  translate([0,-4*OlloSpacing,0])
    rotate([0,90,180])
      pen_holder_frame();
}
