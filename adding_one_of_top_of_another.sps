cylinder c()
solid base = scaling( 1.0, 1.0, 0.1 ) >> c
make base

box b()
solid str = translation(<[0.0, 0.0, 0.1]>) >> b
make str
