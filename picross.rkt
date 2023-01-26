#lang racket/gui
(require racket/gui/base)

;Initialize
   ;Size variable
(define size 5)
   ;Define window
(define frame (new frame% [label "Picross"] [min-width 500] [min-height 600] [style (list 'no-resize-border)]))
;Subareas
   ;Define msgtop group subarea
(define msgtop (new vertical-panel% [parent frame] [border 1]
              [spacing 5] [alignment (list 'center 'top)]))
   ;Define UI group subarea
(define ui (new horizontal-panel% [parent msgtop] [border 1]
              [spacing 5] [alignment (list 'center 'top)]))
   ;Define Board group subarea
(define board (new panel% [parent frame] [alignment (list 'center 'center)]))
;Controls
   ;Generate top msg
(define msg (new message% [parent msgtop] [label "Generate new picross board:"]))
   ;Generate UI group
      ;size slider
(new slider% [parent ui] [label "size"] [style (list 'horizontal 'plain)] [min-value 1] [max-value 32] [init-value size]
     [callback (lambda (slider event) (send gen set-label (~a "Generate of size " (send slider get-value))))])
      ;gen button
(define gen (new button% [parent ui] [label "Generate of size 5"]
     [callback (lambda (button event) (send gen set-label "click"))]))
   ;frame commands
(send msgtop change-children reverse)
;End
(send frame show #t)