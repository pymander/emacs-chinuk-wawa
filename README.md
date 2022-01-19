# What is Chinuk Wawa?

[Chinuk Wawa](https://en.wikipedia.org/wiki/Chinook_Jargon) originated as a type of creole or pidgin trade language in the Pacific Northwest,
incorporating loan words from more than a dozen indigenous and European languages. Though it has a
fairly small lexicon, it is an interesting language with an impressive array of new phonemes for me to
learn. There are 12 different variations on "k", for instance! As you can imagine, with this
variety, it is pretty difficult to type Chinuk Wawa using the standard
Latin alphabet.

This project will focus on the [Grand Ronde dialect](https://www.grandronde.org/services/education/chinuk-wawa-education-program/), which uses an IPA-based alphabet.

# Keyman for Linux

Under Linux, the easiest way to add an IPA-based input method is using the [IPA (SIL) keyboard for
Keyman](https://keyman.com/keyboards/sil_ipa). This integrates quite nicely under GNOME 3 with Ubuntu 20.04. However, I'm a Dvorak typist,
so having to switch back to a QWERTY-style keyboard is frustrating, and was slowing me
down. Instead, I came up with this method for inputing Chinuk Wawa compatible IPA using Emacs.

# Emacs Input Methods

Emacs has an excellent method for switching between input methods, which you can [read more about
in the Emacs manual](https://www.gnu.org/software/emacs/manual/html_node/emacs/Select-Input-Method.html). It comes with a number of IPA input methods, and after taking a look at all
of them, I chose `ipa-x-sampa`, as it seemed to have the best coverage of symbols needed by
Chinuk Wawa. However, it was missing a way to input the very important character "x̣", which was
needed by one of the very first words I learned, "yax̣al"!

I added the following code to my startup file to remedy this. This adds the ability to type **x\_.**
to get **x̣** and **? ** to get **?**, both of which make typing Chinuk Wawa *much* easier for me.

```lisp
(defun chinuk-wawa-quail-rules ()
  "Add Chinuk Wawa rules to the `ipa-x-sampa` input map."
  (interactive)
  (if (string-equal "ipa-x-sampa" (quail-name))
      (quail-define-rules
       ((append . t))
       ("_." #x0323)   ;; allows for x with dot beneath
       ("?/" "?"))     ;; allows for ? character 
    ))

(add-hook 'quail-activate-hook 'chinuk-wawa-quail-rules)
```

As you can see, this method allows plenty of additional characters to be added to `ipa-x-sampa`,
so if it turns out I missed anything or am annoyed by any other side effects of this input
method, I can expand on it later.

aɬqi!

