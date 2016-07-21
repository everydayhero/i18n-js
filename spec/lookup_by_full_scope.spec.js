var I18n = require("../i18n");

describe("Lookup by full scope", function(){
  beforeEach(function(){
    I18n.reset();
    I18n.lookupByFullScope = true;
    I18n.locale = 'nl_NL';
    I18n.translations = {
      "nl_NL" : {
        "js.some.error": "Some error is occured!",
        "time.formats.short": "%d/%m, %H:%M h"
      }
    };
  });

  it("fetches translations by full scope successfully", function(){
    expect(I18n.t("js.some.error")).toEqual("Some error is occured!");
  });

  it("localizes time string using full scope lookup", function(){
    expect(I18n.l("time.formats.short", "2009-01-07 09:12:35")).toEqual("07/01, 09:12 h")
  });
});
