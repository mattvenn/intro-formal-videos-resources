from pysmt.shortcuts import Symbol, And, GE, LT, Plus, Equals, AllDifferent, Int, get_model
from pysmt.typing import INT

hello = [Symbol(s, INT) for s in "hello"]
world = [Symbol(s, INT) for s in "world"]
letters = set(hello+world)

formula = And(
    And([And(GE(l, Int(1)), LT(l, Int(10))) for l in letters]),
    AllDifferent(letters),
    Equals(Plus(hello), Plus(world)),
)

print("Serialization of the formula:")
print(formula)

model = get_model(formula)
if model:
    print("Solution found:")
    print(model)
else:
    print("No solution found")
