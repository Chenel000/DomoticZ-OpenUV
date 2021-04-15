-- OpenUV.lua
return {
	on = {
		timer = {
			'at 08:00-20:00 every 15 minutes' -- This time range and steps allow to fit with 50 request per day limit
		},
		httpResponses = {
			'trigger'
		}
	},
	execute = function(dz, item)
	    	-- Parameters to configure
	    	local uvIndex    = 287 -- Update with the idx of your UV index device. Type UV
		local uvIndexMax = 288 -- Update with the idx of your UV index max device. Type UV
		local ozoneLevel = 289 -- Update with the idx of your Ozone device. Type Custom, units du
		local safeTimeS1 = 290 -- Update with the idx of your idx of Safe Time Skin Type1 device. Units Minutes
		local safeTimeS2 = 291 -- Update with the idx of your idx of Safe Time Skin Type2 device. Units Minutes
		local safeTimeS3 = 292 -- Update with the idx of your idx of Safe Time Skin Type3 device. Units Minutes
		local safeTimeS4 = 293 -- Update with the idx of your idx of Safe Time Skin Type4 device. Units Minutes
		local safeTimeS5 = 294 -- Update with the idx of your idx of Safe Time Skin Type5 device. Units Minutes
		local safeTimeS6 = 295 -- Update with the idx of your idx of Safe Time Skin Type6 device. Units Minutes
		local uvIMaxTime = 296 -- Update with the idx of your idx of UV Max Index Time. Units hh.mm
		local latitude   = '20.34'   -- Update with your longitude
		local altitude   = '600'     -- Update with your altitude
		local apiKey     = 'api_key' -- Update with your api_key
        	
		-- Code
		local Time = require('Time')
		local currentTime = Time()
		local t = Time(currenTime)
		local auxStr = ''
        
 		if (item.isTimer) then
			dz.openURL({
				url = 'https://api.openuv.io/api/v1/uv?lat=' .. latitude .. '&lng=' .. longitude .. '&alt=' .. altitude .. '&dt=' .. t.getISO(),
				method   = 'GET',
				headers = { ['x-access-token'] = apiKey },
				callback = 'trigger',
			})
		end

	  	if (item.isHTTPResponse) then
			if (item.ok) then
				if (item.isJSON) then
					dz.devices(uvIndex).updateUV(dz.utils.round(item.json.result.uv, 1))
					dz.devices(uvIndexMax).updateUV(dz.utils.round(item.json.result.uv_max, 1))
					auxStr = string.sub(dz.utils.urlEncode(item.json.result.uv_max_time), 12, 13) .. '.' .. string.sub(auxStr, 17, 18) 
					dz.devices(uvIMaxTime).updateCustomSensor(auxStr)
	  				dz.devices(ozoneLevel).updateCustomSensor(item.json.result.ozone)
		  			dz.devices(safeTimeS1).updateCustomSensor(item.json.result.safe_exposure_time.st1)
			  		dz.devices(safeTimeS2).updateCustomSensor(item.json.result.safe_exposure_time.st2)
				  	dz.devices(safeTimeS3).updateCustomSensor(item.json.result.safe_exposure_time.st3)
					dz.devices(safeTimeS4).updateCustomSensor(item.json.result.safe_exposure_time.st4)
					dz.devices(safeTimeS5).updateCustomSensor(item.json.result.safe_exposure_time.st5)
					dz.devices(safeTimeS6).updateCustomSensor(item.json.result.safe_exposure_time.st6)
		  		end
			else
				dz.log('There was a problem handling the request', dz.LOG_ERROR)
				dz.log(item, dz.LOG_ERROR)
			end
		end
	end
}
