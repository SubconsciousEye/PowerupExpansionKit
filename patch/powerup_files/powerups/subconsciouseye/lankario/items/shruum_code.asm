;##################################################################################################
;# Item: Weird Mushroom
;# Author: Nintendo
;# Description: Default powerup item for Weird Mario (Lankario).

;################################################
;# Init code for this item

.init
    jsr ..goal
    inc !C2,x
    jml item_return


;################################################
;# Code for initializing the sprite when carrying an item through the goal tape

..goal
    lda #!shruum_acts_like
    sta !9E,x
    jsl init_sprite_tables
    lda.b #!shruum_sprite_prop
    sta !15F6,x
    rts


;################################################
;# Main code for this item

.main
    lda #$01
    pha 
    plb 
    jml $01C371|!bank       ; while this may look dumb and slow, it allows easy editing if needed