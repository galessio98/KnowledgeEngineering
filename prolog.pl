vegetable(tomatoes).
non_vegetable(beff).
contains_lactose(mozzarella).
contains_gluten(flour).

dish(bistecca).
dish(pizza_margherita).
dish(risotto_al_limone).
dish(pizza_pomodoro).
dish(pizza_zucchini).

composed_of(pizza_zucchini,mozzarella).
composed_of(pizza_margherita,flour).
composed_of(pizza_pomodoro, tomatoes).
composed_of(risotto_al_limone, rice).
composed_of(bistecca, meat).

has_calorie(bistecca, high).
has_calorie(pizza_pomodoro, low).
has_calorie(pizza_margherita, medium).
has_calorie(risotto_al_limone, low).

menu(vegetarian, Dish) :- dish(Dish), composed_of(Dish, I), vegetable(I), has_calorie(Dish,_).

menu(vegetarian_calconsious_person, Dish) :- dish(Dish), composed_of(Dish, I), vegetable(I), has_calorie(Dish,low).

menu(nonvegetarian, Dish) :- dish(Dish), composed_of(Dish, I), non_vegetable(I), has_calorie(Dish,_).

menu(calorie_conscious, Dish) :- dish(Dish), composed_of(Dish, I), vegetable(tomatoes), has_calorie(Dish,low).

menu(lactose_intolerance, Dish) :- dish(Dish), composed_of(Dish, I), not(contains_lactose(I)), has_calorie(Dish,_).

menu(gluten_intolerance, Dish) :- dish(Dish), composed_of(Dish, I), not(contains_gluten(I)), has_calorie(Dish,_).

menu(lactose_intolerance_calorie_conscious, Dish) :- dish(Dish), composed_of(Dish, I), not(contains_lactose(I)), has_calorie(Dish,low).



