# Cell-tracking

Segment cells from a greyscale image. 

Main function:
cells = findcells(l, maskout, sm, maxl, minl, th) 

With my values:
cells = findcells(l, maskout, 2, 80, 10, 0.3)

The output cells is a structure of all cells in the iamge with one field: pix - list of (x, y) values of the cell centerlines.

Inputs: 
  l - Brightness image normalized between 0 and 1.
  2 - maskout - mask of regions to exclude (0s in cell regions to calculate, 1s in regions to exclude). Must be the same size as l.
  3 - sm - smoothness for streamline, filter size for calculating the director field for streamline.
  4 - maxl - Maximum cell length (ish), the streamlines will be cut off if it goes beyond this distance in either direction from the test point.
  5 - minl - Minimum cell length. Centerlines calculated from test points that are shorter than this length will be thrown out.
  6 - th - Brightness threshold when finding centerlines cut off for cell ends when brightness goes below this value.
  
