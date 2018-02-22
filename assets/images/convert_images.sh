for i in *.{jpg,png,jpeg}; do 
	convert $i -resize 200x200! thumbs/${i%.*}_thumb.${i##*.}; 
	convert $i -resize 1024x256 features/${i%.*}_feature.${i##*.}; 
	convert $i -resize 500x300 teasers/${i%.*}_teaser.${i##*.}; 
	convert $i -resize 100x100 sidebars/${i%.*}_sidebars.${i##*.}; 
done
