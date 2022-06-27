nonveg_dish(bistecca, high).
nonveg_dish(pesce, medium).
nonveg_dish(kebab, low).

dairy_free_dish(risotto_al_limone, high).
dairy_free_dish(hamburger, medium).
dairy_free_dish(panzanella, low).

veg_dish(pizza_margherita, high).
veg_dish(panzanella, low).
veg_dish(lasagna, medium).
veg_dish(couscous, low).
veg_dish(risotto_al_limone,low).

ingredient(pizza_margherita, vegetable).
ingredient(risotto_al_limone, vegetable).
ingredient(panzanella, vegetable).
ingredient(hamburger, meat).
ingredient(risotto_al_limone, no_dairy).
ingredient(bistecca, meat).

menu(vegan,X,nothing,nothing) :- veg_dish(X,_), 
                         ingredient(X,vegetable).

menu(lactose_intolerance,X,Y,Z) :- veg_dish(X,_),
                      nonveg_dish(Y,_),
                     dairy_free_dish(Z,_),
                    ingredient(_, no_dairy).
                      
menu(carnivores,X,Y,Z) :- veg_dish(X,_),
                         nonveg_dish(Y,_),
                      dairy_free_dish(Z,_),
                      ingredient(_,_).

menu(calorie_conscious,X,Y,Z) :- veg_dish(X, low),
                         nonveg_dish(Y, low),
                      dairy_free_dish(Z, low),
                      ingredient(_,_).

menu(lactose_intolerance_calorie_conscious,X,Y,Z) :- veg_dish(X,low),
                         nonveg_dish(Y,low),
                        dairy_free_dish(Z,low),
                        ingredient(_, no_dairy).

