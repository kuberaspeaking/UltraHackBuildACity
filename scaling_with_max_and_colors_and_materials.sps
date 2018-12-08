open int matType 
{ 
  name = "Material Type" 
  descr = "User chooses Material Type" 
  value = 0 
} 

open int OBJ_SIZE 
{ 
  name = "Object Size" 
  descr = "User chooses Object Size" 
  value = 10
}

open color bldgColor 
{ 
  name = "Color" 
  descr = "Color of building" 
  value = rgb(255,255,0) 
} 

open string fileName
{ 
  name = "FileName" 
  descr = "Name of obj file" 
  value = "box.stl" 
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

file a = "NLD_HI1005_EINDHOVEN_FLYING_PINS_S.stl"
mesh b = mesh(a)

// obtain maximum value
float fileDimensions[]
fileDimensions = getBboxDimensions(b, "cm")
float max_val = max( fileDimensions[0], fileDimensions[1] )
max_val = max( max_val, fileDimensions[2] )

// obtain scaling factor
float scaling_factor = OBJ_SIZE/max_val

// scale down to corresp. factor
solid scaled_b = scaling(scaling_factor, scaling_factor, scaling_factor) >> b

// getting dimensions before scaling
echo(getBboxDimensions(b, "cm"))

// scaling...
//solid scaled_b = scaling(0.015, 0.015, 0.015) >> b

// getting dimensions post scaling
echo(getBboxDimensions(scaled_b, "cm"))

make material(matType, bldgColor) >> scaled_b
