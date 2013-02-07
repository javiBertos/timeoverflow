@APP.factory "I18n", ->

  translations:
    ca:
      "Save changes": "Desar"
    es:

  t: (word) ->
    currentLanguage = "es"
    translations[currentLanguage]?[word] ? word

