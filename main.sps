open int matType 
{ 
  name = "Material Type" 
  descr = "User chooses Material Type" 
  value = 0 
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

file a = fileName
mesh b = mesh(a)
make material(matType,bldgColor) >> b
// make bldgColor >> b


