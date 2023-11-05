# openSSW

do while문을 이용해 입력을 계속해서 받고, switch 문을 이용하여 지시사항에 맞는 행동이 이루어지게 했다.
choice에 입력을 받고, 만약 y or n 인 경우 if문을 이용하여 다음 행동을 따라갔다.

## 1번 기능
1번 기능의 함수인 getMovieData 는 특정 영화 id에 해당하는 값을 grep을 통해 불러왔다.

## 2번 기능
2번 기능의 함수인 getActionMovies는 awk를 이용해 문자열 '|'로 구분했을 때, 7번째에 있는 수가 1일 경우 Action영화 이므로 이에 해당하는 행을 출력했다.
head를 이용하여 10개만 출력했다.

## 3번 기능
3번 기능의 함수인 getMoviesRating는 영화 ID를 이용하여 u.item에서 평점과 count를 이용하여 평균 점수를 출력했다. 출력은 printf의 %.5f 이용하여 소수점 5번째 자리까지 출력했다.

## 4번 기능
4번 기능의 함수인 deleteIMDBurl은 IMDb URL인 %5만 제외하고 출력했다.

## 5번 기능
5번 기능의 함수인 getUserData은 sed를 이용하여 F는 Female로 바꾸고, M은 Male로 바꾼 후 출력했다. sort후 출력 시 100부터 출력되어 -Vk1을 이용하여 1번부터 출력하게 했다. head -10을 이용하여 10개만 출력했다.

## 6번 기능


