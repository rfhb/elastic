# Distance units

Wherever distances need to be specified, such as the distance parameter
in the Geo Distance Filter), the default unit if none is specified is
the meter. Distances can be specified in other units, such as "1km" or
"2mi" (2 miles).

## Details

|                          |               |
|--------------------------|---------------|
| mi or miles              | Mile          |
| yd or yards              | Yard          |
| ft or feet               | Feet          |
| in or inch               | Inch          |
| km or kilometers         | Kilometer     |
| m or meters              | Meter         |
| cm or centimeters        | Centimeter    |
| mm or millimeters        | Millimeter    |
| NM, nmi or nauticalmiles | Nautical mile |

The precision parameter in the Geohash Cell Filter accepts distances
with the above units, but if no unit is specified, then the precision is
interpreted as the length of the geohash.

## See also

[units-time](https://rfhb.github.io/nodbi/reference/units-time.md)
