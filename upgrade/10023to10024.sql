
--
-- Modify existing Velbus modules description
--

UPDATE devicetypes SET description='4 channel relay module' WHERE id=334;
UPDATE devicetypes SET description='4 channel dimmer module' WHERE id=335;
UPDATE devicetypes SET description='7 channel input' WHERE id=336;
UPDATE devicetypes SET description='OLED touch panel' WHERE id=337;
UPDATE devicetypes SET description='Dimmer module' WHERE id=338;
UPDATE devicetypes SET description='4 channel relay module ' WHERE id=663;
UPDATE devicetypes SET description='2 channel blind module' WHERE id=664;
UPDATE devicetypes SET description='4 channel relay module' WHERE id=671;
UPDATE devicetypes SET description='8 channel pushbutton mo' WHERE id=674;

--
-- Add new devicetypes
--

DELETE FROM devicetypes WHERE id=711;
DELETE FROM devicetypes WHERE id=712;
DELETE FROM devicetypes WHERE id=713;
DELETE FROM devicetypes WHERE id=714;
DELETE FROM devicetypes WHERE id=715;
DELETE FROM devicetypes WHERE id=716;
DELETE FROM devicetypes WHERE id=717;
DELETE FROM devicetypes WHERE id=718;
DELETE FROM devicetypes WHERE id=719;
DELETE FROM devicetypes WHERE id=720;
DELETE FROM devicetypes WHERE id=721;

INSERT INTO devicetypes (id, name, description, protocol, addressformat) VALUES (711, 'VMBDMI', 'dimmer for resistive or inductive load', 'Velbus', '\'02\', \'05\' or \'12\'');
INSERT INTO devicetypes (id, name, description, protocol, addressformat) VALUES (712, 'VMBPIRC', 'Ceiling PIR detector module', 'Velbus', '\'02\', \'05\' or \'12\'');
INSERT INTO devicetypes (id, name, description, protocol, addressformat) VALUES (713, 'VMBPIRO', 'Outdoor motion, twilight and temperature sensor', 'Velbus', '\'02\', \'05\' or \'12\'');
INSERT INTO devicetypes (id, name, description, protocol, addressformat) VALUES (714, 'VMB8PBU', '8-channel push-button module', 'Velbus', '\'02\', \'05\' or \'12\'');
INSERT INTO devicetypes (id, name, description, protocol, addressformat) VALUES (715, 'VMB6PBN', 'Push-button interface for 6-/4-fold niko push-buttons', 'Velbus', '\'02\', \'05\' or \'12\'');
INSERT INTO devicetypes (id, name, description, protocol, addressformat) VALUES (716, 'VMBGP2', 'two touch buttons module', 'Velbus', '\'02\', \'05\' or \'12\'');
INSERT INTO devicetypes (id, name, description, protocol, addressformat) VALUES (717, 'VMBGP4', 'four touch buttons module', 'Velbus', '\'02\', \'05\' or \'12\'');
INSERT INTO devicetypes (id, name, description, protocol, addressformat) VALUES (718, 'VMBGPOD', 'Touch panel with Oled display', 'Velbus', '\'02\', \'05\' or \'12\'');
INSERT INTO devicetypes (id, name, description, protocol, addressformat) VALUES (719, 'VMBGP1', 'one touch buttons module', 'Velbus', '\'02\', \'05\' or \'12\'');
INSERT INTO devicetypes (id, name, description, protocol, addressformat) VALUES (720, 'Osram LIGHTIFY Plug','Osram LIGHTIFY Plug','PhilipsHue','\'1\', \'6\' or \'19\'');
INSERT INTO devicetypes (id, name, description, protocol, addressformat) VALUES (721, 'ProMax Switch','ProMax switch and remote','IT','\'00101c 13\', or \'0x00101c 13\'');

--
-- Redo plugin column again, it was missed out in 'domotiga.sql' of 1.0.023
--

ALTER TABLE plugins CHANGE COLUMN `protocols` `protocols` VARCHAR(1024) CHARACTER SET 'utf8' NOT NULL;

--
-- Set the RFXComTRX protocols, to fix the 512/1024 issue and add new protocols
--

UPDATE plugins SET protocols = 'X10 X10Security Oregon KAKU RFXCom AC HEUK ATI Digimax Mertik Ninja Flamingo Waveman HEEU ARC HE105 Koppla RTS10 Harrison Anslut Impuls AB400 EMW200 LightwaveRF TFA LaCrosse UPM Cresta Viking Rubicson RisingSun PhilipsSBC EMW100 BBSB Blyss BlindsT0 BlindsT1 BlindsT2 BlindsT3 BlindsT4 BlindsT5 BlindsT6 BlindsT7 BlindsT8 BlindsT9 BlindsT10 Meiantech ByronSX ByronMP SA30 X10SecDW X10SecMotion X10SecRemote PowerCodeDW PowerCodeMotion PowerCodeAux CodeSecure Energenie Livolo RSL TRC02 MDRemote SF01 RFY RFYEXT Imagintrx WT TRC022 AOKE EuroDomest Smartwares SelectPlus IT Avantek' WHERE id = 35;

--
-- Finally update to 1.0.024
--

DELETE FROM version WHERE db='1.0.024';

LOCK TABLES version WRITE;
INSERT INTO version VALUES (69,'1.0.024');
UNLOCK TABLES;

