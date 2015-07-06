module Genderize
  class Gender < String
  
    attr_reader :abbr

    def initialize(abbr)
      @abbr = abbr.to_s.downcase.first
      super(@abbr)
    end

    def name
      @name ||= translation_for("name")
    end
  
    def subject
      @subject ||= translation_for("subject")
    end
    
    def object
      @object ||= translation_for("object")
    end
    
    def possessive
      @possessive ||= translation_for("possessive")
    end
    
    def casual
      @casual ||= translation_for("casual")
    end
    
    def capital_abbr
      abbr.capitalize
    end
  
    def unknown?
      !male? && !female?
    end
    
    def male?
      abbr == 'm'
    end
  
    def female?
      abbr == 'f'
    end
  
    def ==(val)
      abbr == val.to_s
    end
  
  
    private
  
    
    def translation_for(key)
      case
      when male?    then I18n.t("genderize.#{key}.masculine")
      when female?  then I18n.t("genderize.#{key}.feminine")
      when unknown? then I18n.t("genderize.#{key}.unknown")        
      else
        nil
      end
    end
    
  end
end