
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
  descr = "Color of building"
  value = rgb(255,255,0)
}

echo( select )
switch (select){
    case 0: file a = "box.stl"
mesh b = mesh(a)
make bldgColor >> b
make b
  case 1: file a = "AUS_12857_PERTH_BELLTOWER_L.stl"
mesh b = mesh(a)
make bldgColor >> b
make b
  case 2: file a = "NLD_HI1005_EINDHOVEN_FLYING_PINS_S.stl"
mesh b = mesh(a)
make bldgColor >> b
make b
}
// open file f
// {
//   name = "Mesh upload"
//   descr = "The user shall provide a mesh here."
//   value = "box.stl"
//   }
//   make mesh( f )
