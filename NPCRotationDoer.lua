--[[ I use this to set up a pseudo-rotation when the game forces you to play as an NPC. Normally the NPCs actions are added to the pet hotbar.
Make sure you set the right keybinds for your pet hotbar. The rotation usually doesn't matter, buttons just need to be pressed.


while GetCharacterCondition(34) == true or GetCharacterCondition(56) == true or GetCharacterCondition(91) == true or GetCharacterCondition(95) == true do

yield("/send NUMPAD1 ")
yield("/send NUMPAD2 ")
yield("/send NUMPAD7 ")
yield("/send NUMPAD8 ")
yield("/send NUMPAD9")
yield("/wait 0.5")
end

