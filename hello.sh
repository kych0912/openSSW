#! /bin/bash

getMovieData(){
grep "^$1|" "$2"
}

getActionMovies(){
cat "$1"|awk -F '|' '$7==1{print $1, $2}'|sort -n|head -10
}

getMoviesRating(){
grep "^$1" "$2"|awk -F "\t" '{sum+=$3; count++} END{printf("%.5f",sum/count)}'
}

deleteIMDBurl(){
cat "$1"|awk -F '|' '{print $1 "|" $2 "|" $3 "|" $4 "|" $6 "|" $7 "|" $8 "|" $9 "|" $10 "|" $11 "|" $12 "|" $13 "|" $14 "|" $15 "|" $16 "|" $17 "|" $18 "|" $19 "|" $20 "|" $21 "|" $22}' | head -10
}

getUserData(){
cat "$1"|sed 's/F/Female/g'|sed 's/M/Male/g'|awk -F '|' '{printf("user %d is %d years old %s %s\n",$1,$2,$3,$4)}'|sort -Vk1|head -10
}

modifyReleaseDate(){
cat "$1"|sed -i 's/\([0-9]\{4\}\)-\([A-Za-z]\{3\}\)-\([0-9]\{2\}\)/\1\2\3/g' "$1"|head -10
}

echo "_________________"
echo "User Name: fos"
echo "Student Number: 00000000"
echo "[ MENU ]"
echo "1. Get the data of the movie identified by specific 'movie id' from 'u.item'"
echo "2.Get the data of action genre movies from 'u.item'"
echo "3. Get the average 'rating' of the movie identified by specific 'movie id' from 'u.data'"
echo "4. Delete the 'IMDB URL' from 'u.item'"
echo "5. Get the data about users from 'u.user'"
echo "6. Modify the format of 'release date' in 'u.item'"
echo "7. Get the data of movies rated by a specific 'user id' from 'u.data'"
echo "8. Get the average 'rating' of movies rated by users with 'age' between 20 and 29 and 'occupation' as 'programmer'"
echo "9. Exit"
echo "_________________"

while true
do
read -p "Enter your choice [ 1~9 ]: " choice
case $choice in
1)
echo
read -p "Please enter the 'movie id' (1~1682): " movie_id
getMovieData "$movie_id" "$1"
echo
;;
2)
echo
read -p "Do you want to get the data of 'action' genre movies from 'u.item'?(y/n): " answer
echo
if [ $answer = "y" ]; then
getActionMovies "$1"
fi
;;
3)
echo
read -p "Please enter the 'movie id (1~1682): " movie_id
rating=$(getMoviesRating "$movie_id" "$2")
echo "Average rating of $movie_id: $rating" 
echo
;;
4)
echo
echo "Do you want to delete the 'IMDB URL' from 'u.item'? (y/n)"
read -r choice
if [ $choice = "y" ]; then
deleteIMDBurl "$1"
fi
;;
5)
echo
echo "Do you want to get the data about users from 'u.user'?(y/n)"
read -r choice
if [ $choice = "y" ]; then
getUserData "$3"
fi
;;
6)
echo
echo "Do you want to Modify the format of 'release data' in 'u.item'?(y/n)"
read -r choice
if [ $choice = "y" ]; then
modifyReleaseDate "$1"
fi
;;
7)
;;
8)
echo
echo "Do you want to get the average 'rating' of movies rated by users with 'age' between 20 and 29 and 'occupation' as 'programmer'?(y/n): "
read -r choice
if [ $choice = "y"]; then
echo "8"
fi
;;
9)
echo "Bye!"
exit 0
;;
*)
echo "Invalid Option"
;;
esac
echo
done

