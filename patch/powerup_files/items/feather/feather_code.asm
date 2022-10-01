;##################################################################################################
;# Item: Feather
;# Author: Nintendo
;# Description: Default powerup item for Cape Mario.

;################################################
;# Init code for this item

.init
    jsr ..goal
    inc !C2,x
    jml item_return


;################################################
;# Code for initializing the sprite when carrying an item through the goal tape

..goal
    lda #!feather_acts_like
    sta !9E,x
    jsl init_sprite_tables
    lda.b #!feather_sprite_prop
    sta !15F6,x
    lda.b #!feather_dss_page
    xba 
    lda.b #!feather_dss_id
    jsl find_and_queue_gfx
    rts


;################################################
;# Main code for this item

.main
    lda #$01
    pha 
    plb 
    jml $01C371|!bank       ; while this may look dumb and slow, it allows easy editing if needed