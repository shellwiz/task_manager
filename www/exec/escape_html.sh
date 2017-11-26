#!/bin/bash

sed -r -e 's/<[^ ].*>//g' -e 's/\\/\\\\/g'
#sed -e 's/<//g' -e 's/>//g' -e 's/\\/\\\\/g'
#sed -e 's/</\&lt;/g' -e 's/>/\&gt;/g'
