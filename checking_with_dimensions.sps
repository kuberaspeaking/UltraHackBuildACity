open int select
{
  name = "Select a parameter between 1-2"
  descr = "This integer value will be usable from within the script"
  value = 0
  min = 0
  max = 2
}

open color bldgColor
{
  name = "Color"
  descr = "Color of City"
  value = rgb(255,255,0)
}

function getBboxDimensions( solid s, string uom ) {

  selectbox sBbox = s.min_bbox()

  vector v1 = <[ sBbox.minx,  sBbox.miny, sBbox.minz ]>
  vector v2 = <[ sBbox.maxx,  sBbox.miny, sBbox.minz ]>
  vector v3 = <[ sBbox.minx,  sBbox.maxy, sBbox.minz ]>
  vector v4 = <[ sBbox.minx,  sBbox.miny, sBbox.maxz ]>

  vector connectingVectorV1V2 = v2 - v1
  vector connectingVectorV1V3 = v3 - v1
  vector connectingVectorV1V4 = v4 - v1

  float sDimensions[3]
  sDimensions[0] = | connectingVectorV1V2 |
  sDimensions[1] = | connectingVectorV1V3 |
  sDimensions[2] = | connectingVectorV1V4 |

  if ( uom == 'cm' ) {
    for( int idx = 0; idx < 3; idx++ ) {
      sDimensions[ idx ] *= 10
    }
  }

  if ( uom == 'inch' ) {
    for( int idx = 0; idx < 3; idx++ ) {
      sDimensions[ idx ] *= 25.4
    }
  }

  return sDimensions
}

echo( select )
switch (select){
  case 0: 
    file a = "box.stl"
    mesh b = mesh(a)
    make bldgColor >> b
    echo(getBboxDimensions(b, "inch"))
    // b >> bd
    // checking for scaling
    //make scaling(0.5) >> b
  case 1: 
    file a = "AUS_12858_PERTH_TOWNHALL_S.stl"
    mesh b = mesh(a)
    make bldgColor >> b
  case 2: 
    file a = "NLD_HI1005_EINDHOVEN_FLYING_PINS_S.stl"
    mesh b = mesh(a)
    make bldgColor >> b
  
}




