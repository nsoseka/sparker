json.extract! user, :first_name, :last_name, :maiden_name, :age, :gender, :email, :phone, :username, :password, :birth_date, :image, :blood_group, :height, :weight, :eye_color, :domain, :ip, :mac_address, :university, :ein, :ssn, :user_agent

json.hair user.hair.as_json(except: [:id, :created_at, :deleted_at, :updated_at, :user_id])

json.bank user.bank.as_json(except: [:id, :created_at, :deleted_at, :updated_at, :user_id])

json.company user.company.as_json(except: [:id, :created_at, :deleted_at, :updated_at, :user_id]).merge({ address: user.address.as_json(except: [:id, :created_at, :deleted_at, :updated_at, :user_id, :company_id]).merge({ coordinates: user.address.coordinate.as_json(except: [:id, :created_at, :updated_at, :deleted_at, :address_id])}) })

json.address user.address.as_json(except: [:id, :created_at, :deleted_at, :updated_at, :user_id, :company_id]).merge ({ coordinates: user.address.coordinate.as_json(except: [:id, :created_at, :updated_at, :deleted_at, :address_id]) })

json.url user_url(user, format: :json)
