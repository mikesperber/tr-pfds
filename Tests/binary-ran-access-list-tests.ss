#lang typed-scheme
(require "../binaryrandomaccesslist.ss")
(require typed/test-engine/scheme-tests)

(check-expect (head (ralist 1 2 3 4 5 6 7)) 1)
(check-expect (head (ralist "" "")) "")
(check-expect (tail (ralist 1)) (ralist))
(check-expect (head (tail (ralist 1 2 3 4 5 6 7))) 2)

(check-expect (empty? (tail (ralist 1))) #t)
(check-expect (empty? (tail (ralist 2 1))) #f)

(check-expect (ralist->list (tail (ralist 1 2 3 4 5 6 7)))
              (list 2 3 4 5 6 7))

(check-expect (ralist->list (tail (tail (ralist 1 2 3 4 5 6 7))))
              (list 3 4 5 6 7))

(check-expect (drop (ralist 1) 1) (ralist))
(check-expect (ralist->list (drop (ralist 1 2 3 4 5 6 7) 2)) 
              (list 3 4 5 6 7))

(check-expect (ralist->list (drop (ralist 1 2 3 4 5 6 7) 0))
              (list 1 2 3 4 5 6 7))
(check-error (drop (ralist 1 2 3 4 5 6 7) 8) 
             "Index out of bound : drop")
(check-error (drop (ralist 1 2 3 4 5 6 7) -1) 
             "Index out of bound : drop")

(check-expect (ralist->list (update (ralist 1 2 3 4 5 6 7) 2 1234))
              (list 1 2 1234 4 5 6 7))

(check-expect (ralist->list (update (ralist 1 2 3 4 5 6 7) 0 1234))
              (list 1234 2 3 4 5 6 7))

(check-error (update (ralist 1 2 3 4 5 6 7) -2 1234)
             "Index out of bound : update")

(check-error (update (ralist 1 2 3 4 5 6 7) -2 1234)
             "Index out of bound : update")

(check-expect (list-size null-ralist) 0)
(check-expect (list-size (ralist 1)) 1)
(check-expect (list-size (ralist 1 2 3 4 5 6 7)) 7)
(test)