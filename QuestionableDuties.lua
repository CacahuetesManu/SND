-- While in normal condition keep the snd script on

while true do

-- If entering a duty instance, then turn on BMRAI and auto rotation

   if  GetCharacterCondition(34) == true or GetCharacterCondition(56) == true or GetCharacterCondition(91) == true or GetCharacterCondition(95) == true then
      yield("/wait 1.0041")
      yield("/bmrai on")
      yield("/bmrai followtarget on")
      yield("/bmrai followcombat on")
      yield("/bmrai followoutofcombat on")
      yield("/rotation auto")

-- Wait for duty to end

      while GetCharacterCondition(34) == true or GetCharacterCondition(56) == true or GetCharacterCondition(91) == true or GetCharacterCondition(95) == true do
         yield("/wait 1")
      end

-- When duty is over start Questionable and turn off BMRAI and RSR

      if GetCharacterCondition(34) == false and GetCharacterCondition(56) == false and GetCharacterCondition(91) == false and GetCharacterCondition(95) == false then
         yield("/wait 1.0341")
         yield("/qst start")
         yield("/bmrai off")
         yield("/rotation off")

-- Wait until you enter a new duty before new iteration

         while GetCharacterCondition(34) == false and GetCharacterCondition(56) == false and GetCharacterCondition(91) == false and GetCharacterCondition(95) == false do
            yield("/wait 1")

         end
      end
   end
end
