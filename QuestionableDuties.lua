--Keep the snd script on

while true do
    -- If reaching dialogue click proceed (questionable blocks yesalready so this will do it manually, until the plugin is updated)
    while GetCharacterCondition(34) == false and GetCharacterCondition(56) == false and GetCharacterCondition(91) == false and GetCharacterCondition(95) == false do
        if IsNodeVisible("SelectYesno", 1) == true and GetNodeText("SelectYesno", 11, 2) == "Proceed" then
            yield("/click SelectYesno Yes")
            yield("/wait 2")
        else
            yield("/wait 2")
        end
    end
    -- If entering a duty instance, then turn on BMRAI and auto rotation

    if GetCharacterCondition(34) == true or GetCharacterCondition(56) == true or GetCharacterCondition(91) == true or GetCharacterCondition(95) == true then
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
        end
    end
end
