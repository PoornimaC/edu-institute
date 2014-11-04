# encoding: utf-8
module EduInsConstants
  # Formatting Regular Expressions
  
    #Formatters
  EMAIL_FORMAT  = /(\A(\s*)\Z)|(\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z)/i
  BULK_EMAIL_FORMAT = /([a-zA-Z0-9_\-\.]+)@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,})/  
  URL_FORMAT = /http(s?):\/\/ |[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$/ix #/(ht|f)tp(s?):\/\/ |[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$/ix
  PHONE_NUMBER_FORMAT = /^(\(?\+?[0-9]*\)?)?[0-9_\- \(\)]*$/
 
 
  ONLY_ALPAHABETS = /^[a-zA-Z][a-zA-Z .-]+$/   #/\A[a-zA-Z -.]+\z/
  CITY_FORMAT = /^[a-zA-Z][a-zA-Z ]+$/
  ALPHA_NUMERIC =  /^[a-zA-Z0-9][a-zA-Z_0-9 .-]+$/
 
  MOBILE_NUMBER_FORMAT =  /^[0-9]+$/
  INDIAN_NUMBER_FORMAT =  /^(91)[7-9][0-9]{9}$/
  
  
  
  DATE_TIME_FORMAT = "%d/%m/%Y %I:%M %p"
  DATE_TIME_FORMAT_WITH_SEC = "%d/%m/%Y %I:%M:%S %p"
  DATE_FORMAT = "%d/%m/%Y"
  TIME_FORMAT = "%I:%M %p"
  TIME_FORMAT_24HRS = "%H:%M"
  DATE_FORMAT_REGEXP = /^([1-9]|0[1-9]|1[0-9]|2[0-9]|3[0-1])\/([1-9]|0[1-9]|1[0-2])\/(1[9][0-9][0-9]|2[0][0-9][0-9])/
 
  
  PRECISION_LIMIT = 2

  # Yes No Types
  YES = 1
  NO = 2
  YES_NO_MAPPING = [["Yes", YES], ["No", NO]]

  #Status Active In active Types
  ACTIVE = 1
  INACTIVE = 2
  
  STATUS_MAPPING = [["Active", ACTIVE], ["In Active", INACTIVE]]
  
 

end

class Array
  # Use this function only for Two Dimensional Arrays
  def get_by_key_from_2d_array(idx)
    each {|x| return x[0] if (x[1] == idx)} 
    return ""
  end
  
  def get_value_key_from_2d_array(idx)
    each {|x| return x[1] if (x[0] == idx)} 
    return ""
  end
  
end

class String
  def to_params_hash
    h = Hash.new
    self.split('&').each{|kv| 
      h[kv.split('=')[0]] = kv.split('=')[1]
    }  
    h
  end
end

class OTBMAPIException < Exception
end

class OTBMException < Exception
end

class PrivilegeException < Exception
end

class OTBMAuthException < Exception
end
