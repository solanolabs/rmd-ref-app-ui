#!/usr/bin/ruby
# Usage:
# ruby make-compressor.json.rb 2001 2009 > ../public/sample-data/compressor.json
#
# This will create data to put in the file public/sample-data/compressor.json
# that allows creating an arbitrary number of compressors
# TODO: Write a grunt task to automate this
#
first, last = [2001, 2009]
if (ARGV[1]) then
    first, last = [ARGV[0].to_i, ARGV[1].to_i]
end
if (first < 2000 || last > 2999 || last < first) then
    raise "\nUsage: #{$0} <first> <last>\nfirst, last must be between 2000 and 2999"
end

devices = 2015, *(first..last)
devices.uniq!

puts <<ASSET_DATA
[
ASSET_DATA

devices.each do |i|
    next if i == 2015
    puts <<-ASSET_DATA
    {
        "uri": "/asset/compressor-#{i}",
        "description": "Bently Compressor #{i}",
        "obsolete": false,
        "empty": false,
        "assetId": "compressor-#{i}",
        "parent": "/asset/compressor-1234",
        "specification": "/classification/GE_COMPRESSOR_CYLINDER",
        "propagateState": false,
        "group": "/group/plant-richmond-refinery",
        "attributes": {
            "machineControllerId": {
                "type": "string",
                "enumeration": [
                ],
                "value": [
                    "/asset/Bently.Nevada.3500.Rack#{i}"
                ]
            },
            "summaryMeter": {
                "type": "string",
                "enumeration": [
                ],
                "value": [
                    "crank-frame-velocity",
                    "crank-frame-compressionratio"
                ]
            }
        },
        "tags": [
        ],
        "assetMeter": {
            "crank-frame-compressionratio": {
                "@type": "AssetMeter",
                "uri": "/meter/crank-frame-compressionratio",
                "sourceTagId": "Compressor-#{i}:CompressionRatio",
                "meterDatasource": {
                    "nodeName": "CompressionRatio",
                    "isKpi": "true",
                    "fieldUri": "asset/adh-field-123",
                    "controllerUri": "/sample/machine/controller",
                    "machineUri": "/Compressor-#{i}:CompressionRatio"
                },
                "isManual": false,
                "outputMinimum": 2.5,
                "outputMaximum": 3.1
            },
            "crank-frame-dischargepressure": {
                "@type": "AssetMeter",
                "uri": "/meter/crank-frame-dischargepressure",
                "sourceTagId": "Compressor-#{i}:DischargePressure",
                "meterDatasource": {
                    "nodeName": "DischgPressure",
                    "isKpi": "true",
                    "controllerUri": "/sample/machine/controller",
                    "machineUri": "/Compressor-#{i}:DischargePressure",
                    "meterExtensionsUri": "/asset/compressor-#{i}.meter-extensions.crank-frame-discharge-pressure"
                },
                "isManual": false,
                "outputMinimum": 1,
                "outputMaximum": 22
            },
            "crank-frame-suctionpressure": {
                "@type": "AssetMeter",
                "uri": "/meter/crank-frame-suctionpressure",
                "sourceTagId": "Compressor-#{i}:SuctionPressure",
                "meterDatasource": {
                    "nodeName": "SuctPressure",
                    "fieldUri": "asset/adh-field-456",
                    "controllerUri": "/sample/machine/controller",
                    "machineUri": "/Compressor-#{i}:SuctionPressure"
                },
                "isManual": false,
                "outputMinimum": 0.1,
                "outputMaximum": 0.2
            },
            "crank-frame-maxpressure": {
                "@type": "AssetMeter",
                "uri": "/meter/crank-frame-maxpressure",
                "sourceTagId": "Compressor-#{i}:MaximumPressure",
                "meterDatasource": {
                    "nodeName": "MaxPressure",
                    "fieldUri": "asset/adh-field-456",
                    "controllerUri": "/sample/machine/controller",
                    "machineUri": "/Compressor-#{i}:MaximumPressure"
                },
                "isManual": false,
                "outputMinimum": 21,
                "outputMaximum": 26
            },
            "crank-frame-minpressure": {
                "@type": "AssetMeter",
                "uri": "/meter/crank-frame-minpressure",
                "sourceTagId": "Compressor-#{i}:MinimumPressure",
                "meterDatasource": {
                    "nodeName": "MinPressure",
                    "fieldUri": "asset/adh-field-456",
                    "controllerUri": "/sample/machine/controller",
                    "machineUri": "/Compressor-#{i}:MinimumPressure"
                },
                "isManual": false
            },
            "crank-frame-velocity": {
                "@type": "AssetMeter",
                "uri": "/meter/crank-frame-velocity",
                "sourceTagId": "Compressor-#{i}:Velocity",
                "meterDatasource": {
                    "nodeName": "Velocity",
                    "isKpi": "true",
                    "fieldUri": "asset/adh-field-456",
                    "controllerUri": "/sample/machine/controller",
                    "machineUri": "/Compressor-#{i}:Velocity"
                },
                "isManual": false,
                "outputMinimum": 0,
                "outputMaximum": 0.07
            },
            "crank-frame-temperature": {
                "@type": "AssetMeter",
                "uri": "/meter/crank-frame-temperature",
                "sourceTagId": "Compressor-#{i}:Temperature",
                "meterDatasource": {
                    "nodeName": "Temperature",
                    "fieldUri": "asset/adh-field-456",
                    "controllerUri": "/sample/machine/controller",
                    "machineUri": "/Compressor-#{i}:Temperature"
                },
                "isManual": false,
                "outputMinimum": 65,
                "outputMaximum": 81
            }
        }
    },
    ASSET_DATA
end

puts <<ASSET_DATA
    {
        "uri": "/asset/compressor-2015",
        "description": "Bently Compressor 2015",
        "obsolete": false,
        "empty": false,
        "assetId": "compressor-2015",
        "parent": "/asset/compressor-1234",
        "specification": "/classification/GE_COMPRESSOR_CYLINDER",
        "propagateState": false,
        "group": "/group/plant-richmond-refinery",
        "attributes": {
            "machineControllerId": {
                "type": "string",
                "enumeration": [
                ],
                "value": [
                    "/asset/Bently.Nevada.3500.Rack1"
                ]
            },
            "summaryMeter": {
                "type": "string",
                "enumeration": [
                ],
                "value": [
                    "crank-frame-velocity",
                    "crank-frame-compressionratio"
                ]
            }
        },
        "tags": [
        ],
        "assetMeter": {
            "crank-frame-compressionratio": {
                "@type": "AssetMeter",
                "uri": "/meter/crank-frame-compressionratio",
                "sourceTagId": "Compressor-2015:CompressionRatio",
                "meterDatasource": {
                    "nodeName": "CompressionRatio",
                    "isKpi": "true",
                    "fieldUri": "asset/adh-field-123",
                    "controllerUri": "/sample/machine/controller",
                    "machineUri": "/Compressor-2015:CompressionRatio"
                },
                "isManual": false,
                "outputMinimum": 2.5,
                "outputMaximum": 3
            },
            "crank-frame-dischargepressure": {
                "@type": "AssetMeter",
                "uri": "/meter/crank-frame-dischargepressure",
                "sourceTagId": "Compressor-2015:DischargePressure",
                "meterDatasource": {
                    "nodeName": "DischgPressure",
                    "isKpi": "true",
                    "controllerUri": "/sample/machine/controller",
                    "machineUri": "/Compressor-2015:DischargePressure",
                    "meterExtensionsUri": "/asset/compressor-2015.meter-extensions.crank-frame-discharge-pressure"
                },
                "isManual": false,
                "outputMinimum": 0,
                "outputMaximum": 23
            },
            "crank-frame-suctionpressure": {
                "@type": "AssetMeter",
                "uri": "/meter/crank-frame-suctionpressure",
                "sourceTagId": "Compressor-2015:SuctionPressure",
                "meterDatasource": {
                    "nodeName": "SuctPressure",
                    "fieldUri": "asset/adh-field-456",
                    "controllerUri": "/sample/machine/controller",
                    "machineUri": "/Compressor-2015:SuctionPressure"
                },
                "isManual": false,
                "outputMinimum": 0,
                "outputMaximum": 0.21
            },
            "crank-frame-maxpressure": {
                "@type": "AssetMeter",
                "uri": "/meter/crank-frame-maxpressure",
                "sourceTagId": "Compressor-2015:MaximumPressure",
                "meterDatasource": {
                    "nodeName": "MaxPressure",
                    "fieldUri": "asset/adh-field-456",
                    "controllerUri": "/sample/machine/controller",
                    "machineUri": "/Compressor-2015:MaximumPressure"
                },
                "isManual": false,
                "outputMinimum": 22,
                "outputMaximum": 26
            },
            "crank-frame-minpressure": {
                "@type": "AssetMeter",
                "uri": "/meter/crank-frame-minpressure",
                "sourceTagId": "Compressor-2015:MinimumPressure",
                "meterDatasource": {
                    "nodeName": "MinPressure",
                    "fieldUri": "asset/adh-field-456",
                    "controllerUri": "/sample/machine/controller",
                    "machineUri": "/Compressor-2015:MinimumPressure"
                },
                "isManual": false
            },
            "crank-frame-velocity": {
                "@type": "AssetMeter",
                "uri": "/meter/crank-frame-velocity",
                "sourceTagId": "Compressor-2015:Velocity",
                "meterDatasource": {
                    "nodeName": "Velocity",
                    "isKpi": "true",
                    "fieldUri": "asset/adh-field-456",
                    "controllerUri": "/sample/machine/controller",
                    "machineUri": "/Compressor-2015:Velocity"
                },
                "isManual": false,
                "outputMinimum": 0,
                "outputMaximum": 0.07
            },
            "crank-frame-temperature": {
                "@type": "AssetMeter",
                "uri": "/meter/crank-frame-temperature",
                "sourceTagId": "Compressor-2015:Temperature",
                "meterDatasource": {
                    "nodeName": "Temperature",
                    "fieldUri": "asset/adh-field-456",
                    "controllerUri": "/sample/machine/controller",
                    "machineUri": "/Compressor-2015:Temperature"
                },
                "isManual": false,
                "outputMinimum": 65,
                "outputMaximum": 80
            }
        }
    }
]
ASSET_DATA


__END__
