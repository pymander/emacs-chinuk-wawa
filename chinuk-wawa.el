(require 'quail)

;; (quail-define-package
;;  "chinuk-wawa" "Chinuk Wawa" "Wawa" t
;;  "Chinuk Wawa input based on IPA X-SAMPA")

(defun chinuk-wawa-quail-rules ()
  (interactive)
  (if (string-equal "ipa-x-sampa" (quail-name))
      (quail-define-rules
       ((append . t))
       ("_." #x0323)   ;; allows for x with dot beneath
       ("? " "?"))     ;; allows for ? character 
    ))

(add-hook 'quail-activate-hook 'chinuk-wawa-quail-rules)
                      
                      
