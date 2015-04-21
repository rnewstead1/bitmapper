# Bitmapper

## Requirements

- ruby   2.1.2
- rspec 1.3

## Usage

To run the specs run 
    `rake`
    
## Features
- `I M N` - Create a new M x N image with all pixels coloured white (O).
- `C` - Clears the table, setting all pixels to white (O).
- `L X Y C` - Colours the pixel (X,Y) with colour C.
- `V X Y1 Y2 C` - Draw a vertical segment of colour C in column X between rows Y1 and Y2 (inclusive).
- `H X1 X2 Y C` - Draw a horizontal segment of colour C in row Y between columns X1 and X2 (inclusive).
- `F X Y C` - Fill the region R with the colour C. R is defined as: Pixel (X,Y) belongs to R. Any other pixel which is the same colour as (X,Y) and shares a common side with any pixel in R also belongs to this region.
- `S` - Show the contents of the current image
- `X` - Terminate the session

## Additional Features
- `R A B` - Replaces all pixels of colour A with colour B