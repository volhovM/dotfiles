for a in {3..10}; 
do
	a10=$(($a * 10))
	cp original.jpg mod_$a10.jpg
	if [ ! $a -eq 10 ]; then
		echo "running mogrify resize for $a10"
		mogrify -resize $a10% mod_$a10.jpg
	fi
	for b in {6..9}; 
	do
		b10=$(($b * 10))
		cp -v mod_$a10.jpg mod_$a10"_"$b10.jpg
		echo "shrinking mod_$a10_$b10.jpg"
		mogrify -quality $b10 mod_$a10"_"$b10.jpg
	done
done
		

