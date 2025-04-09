CREATE TABLE `startup_log` (
    `ID` INTEGER NOT NULL,
    `_id` LONGTEXT,
    `hostname` LONGTEXT,
    `startTime` DATETIME,
    `startTimeLocal` LONGTEXT,
    `cmdLine_fk` INTEGER,
    `pid` BIGINT,
    `buildinfo_fk` INTEGER,
    PRIMARY KEY (`ID`)
) CHARSET=utf8mb4;


CREATE TABLE `startup_log_cmdLine` (
    `ID` INTEGER NOT NULL,
    `config` LONGTEXT,
    `net_fk` INTEGER,
    `service` BIT,
    `storage_fk` INTEGER,
    `systemLog_fk` INTEGER,
    PRIMARY KEY (`ID`)
) CHARSET=utf8mb4;


CREATE TABLE `startup_log_cmdLine_net` (
    `ID` INTEGER NOT NULL,
    `bindIp` LONGTEXT,
    `port` INTEGER,
    PRIMARY KEY (`ID`)
) CHARSET=utf8mb4;


CREATE TABLE `startup_log_cmdLine_storage` (
    `ID` INTEGER NOT NULL,
    `dbPath` LONGTEXT,
    PRIMARY KEY (`ID`)
) CHARSET=utf8mb4;


CREATE TABLE `startup_log_cmdLine_systemLog` (
    `ID` INTEGER NOT NULL,
    `destination` LONGTEXT,
    `logAppend` BIT,
    `path` LONGTEXT,
    PRIMARY KEY (`ID`)
) CHARSET=utf8mb4;


CREATE TABLE `startup_log_buildinfo` (
    `ID` INTEGER NOT NULL,
    `version` LONGTEXT,
    `gitVersion` LONGTEXT,
    `targetMinOS` LONGTEXT,
    `allocator` LONGTEXT,
    `javascriptEngine` LONGTEXT,
    `sysInfo` LONGTEXT,
    `openssl_fk` INTEGER,
    `buildEnvironment_fk` INTEGER,
    `bits` INTEGER,
    `debug` BIT,
    `maxBsonObjectSize` INTEGER,
    PRIMARY KEY (`ID`)
) CHARSET=utf8mb4;


CREATE TABLE `startup_log_buildinfo_modules` (
    `ID` INTEGER NOT NULL,
    `parent_fk` INTEGER,
    `INDEX` INTEGER,
    PRIMARY KEY (`ID`)
) CHARSET=utf8mb4;


CREATE TABLE `startup_log_buildinfo_versionArray` (
    `ID` INTEGER NOT NULL,
    `parent_fk` INTEGER,
    `INDEX` INTEGER,
    `Int32` INTEGER,
    PRIMARY KEY (`ID`)
) CHARSET=utf8mb4;


CREATE TABLE `startup_log_buildinfo_openssl` (
    `ID` INTEGER NOT NULL,
    `running` LONGTEXT,
    PRIMARY KEY (`ID`)
) CHARSET=utf8mb4;


CREATE TABLE `startup_log_buildinfo_buildEnvironment` (
    `ID` INTEGER NOT NULL,
    `distmod` LONGTEXT,
    `distarch` LONGTEXT,
    `cc` LONGTEXT,
    `ccflags` LONGTEXT,
    `cxx` LONGTEXT,
    `cxxflags` LONGTEXT,
    `linkflags` LONGTEXT,
    `target_arch` LONGTEXT,
    `target_os` LONGTEXT,
    `cppdefines` LONGTEXT,
    PRIMARY KEY (`ID`)
) CHARSET=utf8mb4;


CREATE TABLE `startup_log_buildinfo_storageEngines` (
    `ID` INTEGER NOT NULL,
    `parent_fk` INTEGER,
    `INDEX` INTEGER,
    `String` LONGTEXT,
    PRIMARY KEY (`ID`)
) CHARSET=utf8mb4;


ALTER TABLE `startup_log`
ADD CONSTRAINT `s3t_startup_log_startup_log_buildinfo_0` FOREIGN KEY (`buildinfo_fk`) REFERENCES `startup_log_buildinfo`(`ID`),
ADD CONSTRAINT `s3t_startup_log_startup_log_cmdLine_0` FOREIGN KEY (`cmdLine_fk`) REFERENCES `startup_log_cmdLine`(`ID`);


ALTER TABLE `startup_log_cmdLine`
ADD CONSTRAINT `s3t_startup_log_cmdLine_startup_log_cmdLine_net_0` FOREIGN KEY (`net_fk`) REFERENCES `startup_log_cmdLine_net`(`ID`),
ADD CONSTRAINT `s3t_startup_log_cmdLine_startup_log_cmdLine_stora_0` FOREIGN KEY (`storage_fk`) REFERENCES `startup_log_cmdLine_storage`(`ID`),
ADD CONSTRAINT `s3t_startup_log_cmdLine_startup_log_cmdLine_syste_0` FOREIGN KEY (`systemLog_fk`) REFERENCES `startup_log_cmdLine_systemLog`(`ID`);


ALTER TABLE `startup_log_buildinfo`
ADD CONSTRAINT `s3t_startup_log_buildinfo_startup_log_buildinfo_bui_0` FOREIGN KEY (`buildEnvironment_fk`) REFERENCES `startup_log_buildinfo_buildEnvironment`(`ID`),
ADD CONSTRAINT `s3t_startup_log_buildinfo_startup_log_buildinfo_ope_0` FOREIGN KEY (`openssl_fk`) REFERENCES `startup_log_buildinfo_openssl`(`ID`);


ALTER TABLE `startup_log_buildinfo_modules`
ADD CONSTRAINT `s3t_startup_log_buildinfo_mod_startup_log_buildinfo_0` FOREIGN KEY (`parent_fk`) REFERENCES `startup_log_buildinfo`(`ID`);


ALTER TABLE `startup_log_buildinfo_versionArray`
ADD CONSTRAINT `s3t_startup_log_buildinfo_ver_startup_log_buildinfo_0` FOREIGN KEY (`parent_fk`) REFERENCES `startup_log_buildinfo`(`ID`);


ALTER TABLE `startup_log_buildinfo_storageEngines`
ADD CONSTRAINT `s3t_startup_log_buildinfo_sto_startup_log_buildinfo_0` FOREIGN KEY (`parent_fk`) REFERENCES `startup_log_buildinfo`(`ID`);



-- { _id: DESKTOP-HRB44I9-1740075139052 }
INSERT INTO `startup_log_buildinfo_buildEnvironment` (`ID`, `distmod`, `distarch`, `cc`, `ccflags`, `cxx`, `cxxflags`, `linkflags`, `target_arch`, `target_os`, `cppdefines`)
    VALUES
        (0, 'windows', 'x86_64', 'cl: Microsoft (R) C/C++ Optimizing Compiler Version 19.31.31107 for x64', '/nologo /WX /FImongo/platform/basic.h /fp:strict /EHsc /W3 /wd4068 /wd4244 /wd4267 /wd4290 /wd4351 /wd4355 /wd4373 /wd4800 /wd4251 /wd4291 /we4013 /we4099 /we4930 /errorReport:none /MD /O2 /Oy- /bigobj /utf-8 /permissive- /Zc:__cplusplus /Zc:sizedDealloc /volatile:iso /diagnostics:caret /std:c++20 /Gw /Gy /Zc:inline', 'cl: Microsoft (R) C/C++ Optimizing Compiler Version 19.31.31107 for x64', '/TP', '/nologo /DEBUG /INCREMENTAL:NO /LARGEADDRESSAWARE /OPT:REF', 'x86_64', 'windows', 'SAFEINT_USE_INTRINSICS 0 PCRE2_STATIC NDEBUG BOOST_ALL_NO_LIB _UNICODE UNICODE _SILENCE_CXX17_ALLOCATOR_VOID_DEPRECATION_WARNING _SILENCE_CXX17_OLD_ALLOCATOR_MEMBERS_DEPRECATION_WARNING _SILENCE_CXX17_CODECVT_HEADER_DEPRECATION_WARNING _SILENCE_ALL_CXX20_DEPRECATION_WARNINGS _CONSOLE _CRT_SECURE_NO_WARNINGS _ENABLE_EXTENDED_ALIGNED_STORAGE _SCL_SECURE_NO_WARNINGS _WIN32_WINNT 0x0A00 BOOST_USE_WINAPI_VERSION 0x0A00 NTDDI_VERSION 0x0A000000 ABSL_FORCE_ALIGNED_ACCESS BOOST_ENABLE_ASSERT_DEBUG_HANDLER BOOST_FILESYSTEM_NO_CXX20_ATOMIC_REF BOOST_LOG_NO_SHORTHAND_NAMES BOOST_LOG_USE_NATIVE_SYSLOG BOOST_LOG_WITHOUT_THREAD_ATTR BOOST_MATH_NO_LONG_DOUBLE_MATH_FUNCTIONS BOOST_SYSTEM_NO_DEPRECATED BOOST_THREAD_USES_DATETIME BOOST_THREAD_VERSION 5');

INSERT INTO `startup_log_buildinfo_openssl` (`ID`, `running`)
    VALUES
        (0, 'Windows SChannel');

INSERT INTO `startup_log_buildinfo` (`ID`, `version`, `gitVersion`, `targetMinOS`, `allocator`, `javascriptEngine`, `sysInfo`, `openssl_fk`, `buildEnvironment_fk`, `bits`, `debug`, `maxBsonObjectSize`)
    VALUES
        (0, '8.0.4', 'bc35ab4305d9920d9d0491c1c9ef9b72383d31f9', 'Windows 7/Windows Server 2008 R2', 'tcmalloc-gperf', 'mozjs', 'deprecated', 0, 0, 64, FALSE, 16777216);

INSERT INTO `startup_log_cmdLine_net` (`ID`, `bindIp`, `port`)
    VALUES
        (0, '127.0.0.1', 27017);

INSERT INTO `startup_log_cmdLine_storage` (`ID`, `dbPath`)
    VALUES
        (0, 'C:\\Program Files\\MongoDB\\Server\\8.0\\data');

INSERT INTO `startup_log_cmdLine_systemLog` (`ID`, `destination`, `logAppend`, `path`)
    VALUES
        (0, 'file', TRUE, 'C:\\Program Files\\MongoDB\\Server\\8.0\\log\\mongod.log');

INSERT INTO `startup_log_cmdLine` (`ID`, `config`, `net_fk`, `service`, `storage_fk`, `systemLog_fk`)
    VALUES
        (0, 'C:\\Program Files\\MongoDB\\Server\\8.0\\bin\\mongod.cfg', 0, TRUE, 0, 0);

INSERT INTO `startup_log` (`ID`, `_id`, `hostname`, `startTime`, `startTimeLocal`, `cmdLine_fk`, `pid`, `buildinfo_fk`)
    VALUES
        (0, 'DESKTOP-HRB44I9-1740075139052', 'DESKTOP-HRB44I9', '2025-02-20 18:12:19.000000', 'Thu Feb 20 13:12:19.052', 0, 4828, 0);

INSERT INTO `startup_log_buildinfo_versionArray` (`ID`, `parent_fk`, `INDEX`, `Int32`)
    VALUES
        (0, 0, 0, 8);

INSERT INTO `startup_log_buildinfo_versionArray` (`ID`, `parent_fk`, `INDEX`, `Int32`)
    VALUES
        (1, 0, 1, 0);

INSERT INTO `startup_log_buildinfo_versionArray` (`ID`, `parent_fk`, `INDEX`, `Int32`)
    VALUES
        (2, 0, 2, 4);

INSERT INTO `startup_log_buildinfo_versionArray` (`ID`, `parent_fk`, `INDEX`, `Int32`)
    VALUES
        (3, 0, 3, 0);

INSERT INTO `startup_log_buildinfo_storageEngines` (`ID`, `parent_fk`, `INDEX`, `String`)
    VALUES
        (0, 0, 0, 'devnull');

INSERT INTO `startup_log_buildinfo_storageEngines` (`ID`, `parent_fk`, `INDEX`, `String`)
    VALUES
        (1, 0, 1, 'wiredTiger');


-- { _id: DESKTOP-HRB44I9-1740593969242 }
INSERT INTO `startup_log_buildinfo_buildEnvironment` (`ID`, `distmod`, `distarch`, `cc`, `ccflags`, `cxx`, `cxxflags`, `linkflags`, `target_arch`, `target_os`, `cppdefines`)
    VALUES
        (1, 'windows', 'x86_64', 'cl: Microsoft (R) C/C++ Optimizing Compiler Version 19.31.31107 for x64', '/nologo /WX /FImongo/platform/basic.h /fp:strict /EHsc /W3 /wd4068 /wd4244 /wd4267 /wd4290 /wd4351 /wd4355 /wd4373 /wd4800 /wd4251 /wd4291 /we4013 /we4099 /we4930 /errorReport:none /MD /O2 /Oy- /bigobj /utf-8 /permissive- /Zc:__cplusplus /Zc:sizedDealloc /volatile:iso /diagnostics:caret /std:c++20 /Gw /Gy /Zc:inline', 'cl: Microsoft (R) C/C++ Optimizing Compiler Version 19.31.31107 for x64', '/TP', '/nologo /DEBUG /INCREMENTAL:NO /LARGEADDRESSAWARE /OPT:REF', 'x86_64', 'windows', 'SAFEINT_USE_INTRINSICS 0 PCRE2_STATIC NDEBUG BOOST_ALL_NO_LIB _UNICODE UNICODE _SILENCE_CXX17_ALLOCATOR_VOID_DEPRECATION_WARNING _SILENCE_CXX17_OLD_ALLOCATOR_MEMBERS_DEPRECATION_WARNING _SILENCE_CXX17_CODECVT_HEADER_DEPRECATION_WARNING _SILENCE_ALL_CXX20_DEPRECATION_WARNINGS _CONSOLE _CRT_SECURE_NO_WARNINGS _ENABLE_EXTENDED_ALIGNED_STORAGE _SCL_SECURE_NO_WARNINGS _WIN32_WINNT 0x0A00 BOOST_USE_WINAPI_VERSION 0x0A00 NTDDI_VERSION 0x0A000000 ABSL_FORCE_ALIGNED_ACCESS BOOST_ENABLE_ASSERT_DEBUG_HANDLER BOOST_FILESYSTEM_NO_CXX20_ATOMIC_REF BOOST_LOG_NO_SHORTHAND_NAMES BOOST_LOG_USE_NATIVE_SYSLOG BOOST_LOG_WITHOUT_THREAD_ATTR BOOST_MATH_NO_LONG_DOUBLE_MATH_FUNCTIONS BOOST_SYSTEM_NO_DEPRECATED BOOST_THREAD_USES_DATETIME BOOST_THREAD_VERSION 5');

INSERT INTO `startup_log_buildinfo_openssl` (`ID`, `running`)
    VALUES
        (1, 'Windows SChannel');

INSERT INTO `startup_log_buildinfo` (`ID`, `version`, `gitVersion`, `targetMinOS`, `allocator`, `javascriptEngine`, `sysInfo`, `openssl_fk`, `buildEnvironment_fk`, `bits`, `debug`, `maxBsonObjectSize`)
    VALUES
        (1, '8.0.4', 'bc35ab4305d9920d9d0491c1c9ef9b72383d31f9', 'Windows 7/Windows Server 2008 R2', 'tcmalloc-gperf', 'mozjs', 'deprecated', 1, 1, 64, FALSE, 16777216);

INSERT INTO `startup_log_cmdLine_net` (`ID`, `bindIp`, `port`)
    VALUES
        (1, '127.0.0.1', 27017);

INSERT INTO `startup_log_cmdLine_storage` (`ID`, `dbPath`)
    VALUES
        (1, 'C:\\Program Files\\MongoDB\\Server\\8.0\\data');

INSERT INTO `startup_log_cmdLine_systemLog` (`ID`, `destination`, `logAppend`, `path`)
    VALUES
        (1, 'file', TRUE, 'C:\\Program Files\\MongoDB\\Server\\8.0\\log\\mongod.log');

INSERT INTO `startup_log_cmdLine` (`ID`, `config`, `net_fk`, `service`, `storage_fk`, `systemLog_fk`)
    VALUES
        (1, 'C:\\Program Files\\MongoDB\\Server\\8.0\\bin\\mongod.cfg', 1, TRUE, 1, 1);

INSERT INTO `startup_log` (`ID`, `_id`, `hostname`, `startTime`, `startTimeLocal`, `cmdLine_fk`, `pid`, `buildinfo_fk`)
    VALUES
        (1, 'DESKTOP-HRB44I9-1740593969242', 'DESKTOP-HRB44I9', '2025-02-26 18:19:29.000000', 'Wed Feb 26 13:19:29.242', 1, 6032, 1);

INSERT INTO `startup_log_buildinfo_versionArray` (`ID`, `parent_fk`, `INDEX`, `Int32`)
    VALUES
        (4, 1, 0, 8);

INSERT INTO `startup_log_buildinfo_versionArray` (`ID`, `parent_fk`, `INDEX`, `Int32`)
    VALUES
        (5, 1, 1, 0);

INSERT INTO `startup_log_buildinfo_versionArray` (`ID`, `parent_fk`, `INDEX`, `Int32`)
    VALUES
        (6, 1, 2, 4);

INSERT INTO `startup_log_buildinfo_versionArray` (`ID`, `parent_fk`, `INDEX`, `Int32`)
    VALUES
        (7, 1, 3, 0);

INSERT INTO `startup_log_buildinfo_storageEngines` (`ID`, `parent_fk`, `INDEX`, `String`)
    VALUES
        (2, 1, 0, 'devnull');

INSERT INTO `startup_log_buildinfo_storageEngines` (`ID`, `parent_fk`, `INDEX`, `String`)
    VALUES
        (3, 1, 1, 'wiredTiger');


-- { _id: DESKTOP-HRB44I9-1740778540962 }
INSERT INTO `startup_log_buildinfo_buildEnvironment` (`ID`, `distmod`, `distarch`, `cc`, `ccflags`, `cxx`, `cxxflags`, `linkflags`, `target_arch`, `target_os`, `cppdefines`)
    VALUES
        (2, 'windows', 'x86_64', 'cl: Microsoft (R) C/C++ Optimizing Compiler Version 19.31.31107 for x64', '/nologo /WX /FImongo/platform/basic.h /fp:strict /EHsc /W3 /wd4068 /wd4244 /wd4267 /wd4290 /wd4351 /wd4355 /wd4373 /wd4800 /wd4251 /wd4291 /we4013 /we4099 /we4930 /errorReport:none /MD /O2 /Oy- /bigobj /utf-8 /permissive- /Zc:__cplusplus /Zc:sizedDealloc /volatile:iso /diagnostics:caret /std:c++20 /Gw /Gy /Zc:inline', 'cl: Microsoft (R) C/C++ Optimizing Compiler Version 19.31.31107 for x64', '/TP', '/nologo /DEBUG /INCREMENTAL:NO /LARGEADDRESSAWARE /OPT:REF', 'x86_64', 'windows', 'SAFEINT_USE_INTRINSICS 0 PCRE2_STATIC NDEBUG BOOST_ALL_NO_LIB _UNICODE UNICODE _SILENCE_CXX17_ALLOCATOR_VOID_DEPRECATION_WARNING _SILENCE_CXX17_OLD_ALLOCATOR_MEMBERS_DEPRECATION_WARNING _SILENCE_CXX17_CODECVT_HEADER_DEPRECATION_WARNING _SILENCE_ALL_CXX20_DEPRECATION_WARNINGS _CONSOLE _CRT_SECURE_NO_WARNINGS _ENABLE_EXTENDED_ALIGNED_STORAGE _SCL_SECURE_NO_WARNINGS _WIN32_WINNT 0x0A00 BOOST_USE_WINAPI_VERSION 0x0A00 NTDDI_VERSION 0x0A000000 ABSL_FORCE_ALIGNED_ACCESS BOOST_ENABLE_ASSERT_DEBUG_HANDLER BOOST_FILESYSTEM_NO_CXX20_ATOMIC_REF BOOST_LOG_NO_SHORTHAND_NAMES BOOST_LOG_USE_NATIVE_SYSLOG BOOST_LOG_WITHOUT_THREAD_ATTR BOOST_MATH_NO_LONG_DOUBLE_MATH_FUNCTIONS BOOST_SYSTEM_NO_DEPRECATED BOOST_THREAD_USES_DATETIME BOOST_THREAD_VERSION 5');

INSERT INTO `startup_log_buildinfo_openssl` (`ID`, `running`)
    VALUES
        (2, 'Windows SChannel');

INSERT INTO `startup_log_buildinfo` (`ID`, `version`, `gitVersion`, `targetMinOS`, `allocator`, `javascriptEngine`, `sysInfo`, `openssl_fk`, `buildEnvironment_fk`, `bits`, `debug`, `maxBsonObjectSize`)
    VALUES
        (2, '8.0.4', 'bc35ab4305d9920d9d0491c1c9ef9b72383d31f9', 'Windows 7/Windows Server 2008 R2', 'tcmalloc-gperf', 'mozjs', 'deprecated', 2, 2, 64, FALSE, 16777216);

INSERT INTO `startup_log_cmdLine_net` (`ID`, `bindIp`, `port`)
    VALUES
        (2, '127.0.0.1', 27017);

INSERT INTO `startup_log_cmdLine_storage` (`ID`, `dbPath`)
    VALUES
        (2, 'C:\\Program Files\\MongoDB\\Server\\8.0\\data');

INSERT INTO `startup_log_cmdLine_systemLog` (`ID`, `destination`, `logAppend`, `path`)
    VALUES
        (2, 'file', TRUE, 'C:\\Program Files\\MongoDB\\Server\\8.0\\log\\mongod.log');

INSERT INTO `startup_log_cmdLine` (`ID`, `config`, `net_fk`, `service`, `storage_fk`, `systemLog_fk`)
    VALUES
        (2, 'C:\\Program Files\\MongoDB\\Server\\8.0\\bin\\mongod.cfg', 2, TRUE, 2, 2);

INSERT INTO `startup_log` (`ID`, `_id`, `hostname`, `startTime`, `startTimeLocal`, `cmdLine_fk`, `pid`, `buildinfo_fk`)
    VALUES
        (2, 'DESKTOP-HRB44I9-1740778540962', 'DESKTOP-HRB44I9', '2025-02-28 21:35:40.000000', 'Fri Feb 28 16:35:40.962', 2, 6164, 2);

INSERT INTO `startup_log_buildinfo_versionArray` (`ID`, `parent_fk`, `INDEX`, `Int32`)
    VALUES
        (8, 2, 0, 8);

INSERT INTO `startup_log_buildinfo_versionArray` (`ID`, `parent_fk`, `INDEX`, `Int32`)
    VALUES
        (9, 2, 1, 0);

INSERT INTO `startup_log_buildinfo_versionArray` (`ID`, `parent_fk`, `INDEX`, `Int32`)
    VALUES
        (10, 2, 2, 4);

INSERT INTO `startup_log_buildinfo_versionArray` (`ID`, `parent_fk`, `INDEX`, `Int32`)
    VALUES
        (11, 2, 3, 0);

INSERT INTO `startup_log_buildinfo_storageEngines` (`ID`, `parent_fk`, `INDEX`, `String`)
    VALUES
        (4, 2, 0, 'devnull');

INSERT INTO `startup_log_buildinfo_storageEngines` (`ID`, `parent_fk`, `INDEX`, `String`)
    VALUES
        (5, 2, 1, 'wiredTiger');


-- { _id: DESKTOP-HRB44I9-1740966756413 }
INSERT INTO `startup_log_buildinfo_buildEnvironment` (`ID`, `distmod`, `distarch`, `cc`, `ccflags`, `cxx`, `cxxflags`, `linkflags`, `target_arch`, `target_os`, `cppdefines`)
    VALUES
        (3, 'windows', 'x86_64', 'cl: Microsoft (R) C/C++ Optimizing Compiler Version 19.31.31107 for x64', '/nologo /WX /FImongo/platform/basic.h /fp:strict /EHsc /W3 /wd4068 /wd4244 /wd4267 /wd4290 /wd4351 /wd4355 /wd4373 /wd4800 /wd4251 /wd4291 /we4013 /we4099 /we4930 /errorReport:none /MD /O2 /Oy- /bigobj /utf-8 /permissive- /Zc:__cplusplus /Zc:sizedDealloc /volatile:iso /diagnostics:caret /std:c++20 /Gw /Gy /Zc:inline', 'cl: Microsoft (R) C/C++ Optimizing Compiler Version 19.31.31107 for x64', '/TP', '/nologo /DEBUG /INCREMENTAL:NO /LARGEADDRESSAWARE /OPT:REF', 'x86_64', 'windows', 'SAFEINT_USE_INTRINSICS 0 PCRE2_STATIC NDEBUG BOOST_ALL_NO_LIB _UNICODE UNICODE _SILENCE_CXX17_ALLOCATOR_VOID_DEPRECATION_WARNING _SILENCE_CXX17_OLD_ALLOCATOR_MEMBERS_DEPRECATION_WARNING _SILENCE_CXX17_CODECVT_HEADER_DEPRECATION_WARNING _SILENCE_ALL_CXX20_DEPRECATION_WARNINGS _CONSOLE _CRT_SECURE_NO_WARNINGS _ENABLE_EXTENDED_ALIGNED_STORAGE _SCL_SECURE_NO_WARNINGS _WIN32_WINNT 0x0A00 BOOST_USE_WINAPI_VERSION 0x0A00 NTDDI_VERSION 0x0A000000 ABSL_FORCE_ALIGNED_ACCESS BOOST_ENABLE_ASSERT_DEBUG_HANDLER BOOST_FILESYSTEM_NO_CXX20_ATOMIC_REF BOOST_LOG_NO_SHORTHAND_NAMES BOOST_LOG_USE_NATIVE_SYSLOG BOOST_LOG_WITHOUT_THREAD_ATTR BOOST_MATH_NO_LONG_DOUBLE_MATH_FUNCTIONS BOOST_SYSTEM_NO_DEPRECATED BOOST_THREAD_USES_DATETIME BOOST_THREAD_VERSION 5');

INSERT INTO `startup_log_buildinfo_openssl` (`ID`, `running`)
    VALUES
        (3, 'Windows SChannel');

INSERT INTO `startup_log_buildinfo` (`ID`, `version`, `gitVersion`, `targetMinOS`, `allocator`, `javascriptEngine`, `sysInfo`, `openssl_fk`, `buildEnvironment_fk`, `bits`, `debug`, `maxBsonObjectSize`)
    VALUES
        (3, '8.0.4', 'bc35ab4305d9920d9d0491c1c9ef9b72383d31f9', 'Windows 7/Windows Server 2008 R2', 'tcmalloc-gperf', 'mozjs', 'deprecated', 3, 3, 64, FALSE, 16777216);

INSERT INTO `startup_log_cmdLine_net` (`ID`, `bindIp`, `port`)
    VALUES
        (3, '127.0.0.1', 27017);

INSERT INTO `startup_log_cmdLine_storage` (`ID`, `dbPath`)
    VALUES
        (3, 'C:\\Program Files\\MongoDB\\Server\\8.0\\data');

INSERT INTO `startup_log_cmdLine_systemLog` (`ID`, `destination`, `logAppend`, `path`)
    VALUES
        (3, 'file', TRUE, 'C:\\Program Files\\MongoDB\\Server\\8.0\\log\\mongod.log');

INSERT INTO `startup_log_cmdLine` (`ID`, `config`, `net_fk`, `service`, `storage_fk`, `systemLog_fk`)
    VALUES
        (3, 'C:\\Program Files\\MongoDB\\Server\\8.0\\bin\\mongod.cfg', 3, TRUE, 3, 3);

INSERT INTO `startup_log` (`ID`, `_id`, `hostname`, `startTime`, `startTimeLocal`, `cmdLine_fk`, `pid`, `buildinfo_fk`)
    VALUES
        (3, 'DESKTOP-HRB44I9-1740966756413', 'DESKTOP-HRB44I9', '2025-03-03 01:52:36.000000', 'Sun Mar  2 20:52:36.413', 3, 6404, 3);

INSERT INTO `startup_log_buildinfo_versionArray` (`ID`, `parent_fk`, `INDEX`, `Int32`)
    VALUES
        (12, 3, 0, 8);

INSERT INTO `startup_log_buildinfo_versionArray` (`ID`, `parent_fk`, `INDEX`, `Int32`)
    VALUES
        (13, 3, 1, 0);

INSERT INTO `startup_log_buildinfo_versionArray` (`ID`, `parent_fk`, `INDEX`, `Int32`)
    VALUES
        (14, 3, 2, 4);

INSERT INTO `startup_log_buildinfo_versionArray` (`ID`, `parent_fk`, `INDEX`, `Int32`)
    VALUES
        (15, 3, 3, 0);

INSERT INTO `startup_log_buildinfo_storageEngines` (`ID`, `parent_fk`, `INDEX`, `String`)
    VALUES
        (6, 3, 0, 'devnull');

INSERT INTO `startup_log_buildinfo_storageEngines` (`ID`, `parent_fk`, `INDEX`, `String`)
    VALUES
        (7, 3, 1, 'wiredTiger');


-- { _id: DESKTOP-HRB44I9-1741829223299 }
INSERT INTO `startup_log_buildinfo_buildEnvironment` (`ID`, `distmod`, `distarch`, `cc`, `ccflags`, `cxx`, `cxxflags`, `linkflags`, `target_arch`, `target_os`, `cppdefines`)
    VALUES
        (4, 'windows', 'x86_64', 'cl: Microsoft (R) C/C++ Optimizing Compiler Version 19.31.31107 for x64', '/nologo /WX /FImongo/platform/basic.h /fp:strict /EHsc /W3 /wd4068 /wd4244 /wd4267 /wd4290 /wd4351 /wd4355 /wd4373 /wd4800 /wd4251 /wd4291 /we4013 /we4099 /we4930 /errorReport:none /MD /O2 /Oy- /bigobj /utf-8 /permissive- /Zc:__cplusplus /Zc:sizedDealloc /volatile:iso /diagnostics:caret /std:c++20 /Gw /Gy /Zc:inline', 'cl: Microsoft (R) C/C++ Optimizing Compiler Version 19.31.31107 for x64', '/TP', '/nologo /DEBUG /INCREMENTAL:NO /LARGEADDRESSAWARE /OPT:REF', 'x86_64', 'windows', 'SAFEINT_USE_INTRINSICS 0 PCRE2_STATIC NDEBUG BOOST_ALL_NO_LIB _UNICODE UNICODE _SILENCE_CXX17_ALLOCATOR_VOID_DEPRECATION_WARNING _SILENCE_CXX17_OLD_ALLOCATOR_MEMBERS_DEPRECATION_WARNING _SILENCE_CXX17_CODECVT_HEADER_DEPRECATION_WARNING _SILENCE_ALL_CXX20_DEPRECATION_WARNINGS _CONSOLE _CRT_SECURE_NO_WARNINGS _ENABLE_EXTENDED_ALIGNED_STORAGE _SCL_SECURE_NO_WARNINGS _WIN32_WINNT 0x0A00 BOOST_USE_WINAPI_VERSION 0x0A00 NTDDI_VERSION 0x0A000000 ABSL_FORCE_ALIGNED_ACCESS BOOST_ENABLE_ASSERT_DEBUG_HANDLER BOOST_FILESYSTEM_NO_CXX20_ATOMIC_REF BOOST_LOG_NO_SHORTHAND_NAMES BOOST_LOG_USE_NATIVE_SYSLOG BOOST_LOG_WITHOUT_THREAD_ATTR BOOST_MATH_NO_LONG_DOUBLE_MATH_FUNCTIONS BOOST_SYSTEM_NO_DEPRECATED BOOST_THREAD_USES_DATETIME BOOST_THREAD_VERSION 5');

INSERT INTO `startup_log_buildinfo_openssl` (`ID`, `running`)
    VALUES
        (4, 'Windows SChannel');

INSERT INTO `startup_log_buildinfo` (`ID`, `version`, `gitVersion`, `targetMinOS`, `allocator`, `javascriptEngine`, `sysInfo`, `openssl_fk`, `buildEnvironment_fk`, `bits`, `debug`, `maxBsonObjectSize`)
    VALUES
        (4, '8.0.4', 'bc35ab4305d9920d9d0491c1c9ef9b72383d31f9', 'Windows 7/Windows Server 2008 R2', 'tcmalloc-gperf', 'mozjs', 'deprecated', 4, 4, 64, FALSE, 16777216);

INSERT INTO `startup_log_cmdLine_net` (`ID`, `bindIp`, `port`)
    VALUES
        (4, '127.0.0.1', 27017);

INSERT INTO `startup_log_cmdLine_storage` (`ID`, `dbPath`)
    VALUES
        (4, 'C:\\Program Files\\MongoDB\\Server\\8.0\\data');

INSERT INTO `startup_log_cmdLine_systemLog` (`ID`, `destination`, `logAppend`, `path`)
    VALUES
        (4, 'file', TRUE, 'C:\\Program Files\\MongoDB\\Server\\8.0\\log\\mongod.log');

INSERT INTO `startup_log_cmdLine` (`ID`, `config`, `net_fk`, `service`, `storage_fk`, `systemLog_fk`)
    VALUES
        (4, 'C:\\Program Files\\MongoDB\\Server\\8.0\\bin\\mongod.cfg', 4, TRUE, 4, 4);

INSERT INTO `startup_log` (`ID`, `_id`, `hostname`, `startTime`, `startTimeLocal`, `cmdLine_fk`, `pid`, `buildinfo_fk`)
    VALUES
        (4, 'DESKTOP-HRB44I9-1741829223299', 'DESKTOP-HRB44I9', '2025-03-13 01:27:03.000000', 'Wed Mar 12 20:27:03.299', 4, 7772, 4);

INSERT INTO `startup_log_buildinfo_versionArray` (`ID`, `parent_fk`, `INDEX`, `Int32`)
    VALUES
        (16, 4, 0, 8);

INSERT INTO `startup_log_buildinfo_versionArray` (`ID`, `parent_fk`, `INDEX`, `Int32`)
    VALUES
        (17, 4, 1, 0);

INSERT INTO `startup_log_buildinfo_versionArray` (`ID`, `parent_fk`, `INDEX`, `Int32`)
    VALUES
        (18, 4, 2, 4);

INSERT INTO `startup_log_buildinfo_versionArray` (`ID`, `parent_fk`, `INDEX`, `Int32`)
    VALUES
        (19, 4, 3, 0);

INSERT INTO `startup_log_buildinfo_storageEngines` (`ID`, `parent_fk`, `INDEX`, `String`)
    VALUES
        (8, 4, 0, 'devnull');

INSERT INTO `startup_log_buildinfo_storageEngines` (`ID`, `parent_fk`, `INDEX`, `String`)
    VALUES
        (9, 4, 1, 'wiredTiger');


-- { _id: DESKTOP-HRB44I9-1741829329447 }
INSERT INTO `startup_log_buildinfo_buildEnvironment` (`ID`, `distmod`, `distarch`, `cc`, `ccflags`, `cxx`, `cxxflags`, `linkflags`, `target_arch`, `target_os`, `cppdefines`)
    VALUES
        (5, 'windows', 'x86_64', 'cl: Microsoft (R) C/C++ Optimizing Compiler Version 19.31.31107 for x64', '/nologo /WX /FImongo/platform/basic.h /fp:strict /EHsc /W3 /wd4068 /wd4244 /wd4267 /wd4290 /wd4351 /wd4355 /wd4373 /wd4800 /wd4251 /wd4291 /we4013 /we4099 /we4930 /errorReport:none /MD /O2 /Oy- /bigobj /utf-8 /permissive- /Zc:__cplusplus /Zc:sizedDealloc /volatile:iso /diagnostics:caret /std:c++20 /Gw /Gy /Zc:inline', 'cl: Microsoft (R) C/C++ Optimizing Compiler Version 19.31.31107 for x64', '/TP', '/nologo /DEBUG /INCREMENTAL:NO /LARGEADDRESSAWARE /OPT:REF', 'x86_64', 'windows', 'SAFEINT_USE_INTRINSICS 0 PCRE2_STATIC NDEBUG BOOST_ALL_NO_LIB _UNICODE UNICODE _SILENCE_CXX17_ALLOCATOR_VOID_DEPRECATION_WARNING _SILENCE_CXX17_OLD_ALLOCATOR_MEMBERS_DEPRECATION_WARNING _SILENCE_CXX17_CODECVT_HEADER_DEPRECATION_WARNING _SILENCE_ALL_CXX20_DEPRECATION_WARNINGS _CONSOLE _CRT_SECURE_NO_WARNINGS _ENABLE_EXTENDED_ALIGNED_STORAGE _SCL_SECURE_NO_WARNINGS _WIN32_WINNT 0x0A00 BOOST_USE_WINAPI_VERSION 0x0A00 NTDDI_VERSION 0x0A000000 ABSL_FORCE_ALIGNED_ACCESS BOOST_ENABLE_ASSERT_DEBUG_HANDLER BOOST_FILESYSTEM_NO_CXX20_ATOMIC_REF BOOST_LOG_NO_SHORTHAND_NAMES BOOST_LOG_USE_NATIVE_SYSLOG BOOST_LOG_WITHOUT_THREAD_ATTR BOOST_MATH_NO_LONG_DOUBLE_MATH_FUNCTIONS BOOST_SYSTEM_NO_DEPRECATED BOOST_THREAD_USES_DATETIME BOOST_THREAD_VERSION 5');

INSERT INTO `startup_log_buildinfo_openssl` (`ID`, `running`)
    VALUES
        (5, 'Windows SChannel');

INSERT INTO `startup_log_buildinfo` (`ID`, `version`, `gitVersion`, `targetMinOS`, `allocator`, `javascriptEngine`, `sysInfo`, `openssl_fk`, `buildEnvironment_fk`, `bits`, `debug`, `maxBsonObjectSize`)
    VALUES
        (5, '8.0.4', 'bc35ab4305d9920d9d0491c1c9ef9b72383d31f9', 'Windows 7/Windows Server 2008 R2', 'tcmalloc-gperf', 'mozjs', 'deprecated', 5, 5, 64, FALSE, 16777216);

INSERT INTO `startup_log_cmdLine_net` (`ID`, `bindIp`, `port`)
    VALUES
        (5, '127.0.0.1', 27017);

INSERT INTO `startup_log_cmdLine_storage` (`ID`, `dbPath`)
    VALUES
        (5, 'C:\\Program Files\\MongoDB\\Server\\8.0\\data');

INSERT INTO `startup_log_cmdLine_systemLog` (`ID`, `destination`, `logAppend`, `path`)
    VALUES
        (5, 'file', TRUE, 'C:\\Program Files\\MongoDB\\Server\\8.0\\log\\mongod.log');

INSERT INTO `startup_log_cmdLine` (`ID`, `config`, `net_fk`, `service`, `storage_fk`, `systemLog_fk`)
    VALUES
        (5, 'C:\\Program Files\\MongoDB\\Server\\8.0\\bin\\mongod.cfg', 5, TRUE, 5, 5);

INSERT INTO `startup_log` (`ID`, `_id`, `hostname`, `startTime`, `startTimeLocal`, `cmdLine_fk`, `pid`, `buildinfo_fk`)
    VALUES
        (5, 'DESKTOP-HRB44I9-1741829329447', 'DESKTOP-HRB44I9', '2025-03-13 01:28:49.000000', 'Wed Mar 12 20:28:49.447', 5, 5368, 5);

INSERT INTO `startup_log_buildinfo_versionArray` (`ID`, `parent_fk`, `INDEX`, `Int32`)
    VALUES
        (20, 5, 0, 8);

INSERT INTO `startup_log_buildinfo_versionArray` (`ID`, `parent_fk`, `INDEX`, `Int32`)
    VALUES
        (21, 5, 1, 0);

INSERT INTO `startup_log_buildinfo_versionArray` (`ID`, `parent_fk`, `INDEX`, `Int32`)
    VALUES
        (22, 5, 2, 4);

INSERT INTO `startup_log_buildinfo_versionArray` (`ID`, `parent_fk`, `INDEX`, `Int32`)
    VALUES
        (23, 5, 3, 0);

INSERT INTO `startup_log_buildinfo_storageEngines` (`ID`, `parent_fk`, `INDEX`, `String`)
    VALUES
        (10, 5, 0, 'devnull');

INSERT INTO `startup_log_buildinfo_storageEngines` (`ID`, `parent_fk`, `INDEX`, `String`)
    VALUES
        (11, 5, 1, 'wiredTiger');


-- { _id: DESKTOP-HRB44I9-1741986554510 }
INSERT INTO `startup_log_buildinfo_buildEnvironment` (`ID`, `distmod`, `distarch`, `cc`, `ccflags`, `cxx`, `cxxflags`, `linkflags`, `target_arch`, `target_os`, `cppdefines`)
    VALUES
        (6, 'windows', 'x86_64', 'cl: Microsoft (R) C/C++ Optimizing Compiler Version 19.31.31107 for x64', '/nologo /WX /FImongo/platform/basic.h /fp:strict /EHsc /W3 /wd4068 /wd4244 /wd4267 /wd4290 /wd4351 /wd4355 /wd4373 /wd4800 /wd4251 /wd4291 /we4013 /we4099 /we4930 /errorReport:none /MD /O2 /Oy- /bigobj /utf-8 /permissive- /Zc:__cplusplus /Zc:sizedDealloc /volatile:iso /diagnostics:caret /std:c++20 /Gw /Gy /Zc:inline', 'cl: Microsoft (R) C/C++ Optimizing Compiler Version 19.31.31107 for x64', '/TP', '/nologo /DEBUG /INCREMENTAL:NO /LARGEADDRESSAWARE /OPT:REF', 'x86_64', 'windows', 'SAFEINT_USE_INTRINSICS 0 PCRE2_STATIC NDEBUG BOOST_ALL_NO_LIB _UNICODE UNICODE _SILENCE_CXX17_ALLOCATOR_VOID_DEPRECATION_WARNING _SILENCE_CXX17_OLD_ALLOCATOR_MEMBERS_DEPRECATION_WARNING _SILENCE_CXX17_CODECVT_HEADER_DEPRECATION_WARNING _SILENCE_ALL_CXX20_DEPRECATION_WARNINGS _CONSOLE _CRT_SECURE_NO_WARNINGS _ENABLE_EXTENDED_ALIGNED_STORAGE _SCL_SECURE_NO_WARNINGS _WIN32_WINNT 0x0A00 BOOST_USE_WINAPI_VERSION 0x0A00 NTDDI_VERSION 0x0A000000 ABSL_FORCE_ALIGNED_ACCESS BOOST_ENABLE_ASSERT_DEBUG_HANDLER BOOST_FILESYSTEM_NO_CXX20_ATOMIC_REF BOOST_LOG_NO_SHORTHAND_NAMES BOOST_LOG_USE_NATIVE_SYSLOG BOOST_LOG_WITHOUT_THREAD_ATTR BOOST_MATH_NO_LONG_DOUBLE_MATH_FUNCTIONS BOOST_SYSTEM_NO_DEPRECATED BOOST_THREAD_USES_DATETIME BOOST_THREAD_VERSION 5');

INSERT INTO `startup_log_buildinfo_openssl` (`ID`, `running`)
    VALUES
        (6, 'Windows SChannel');

INSERT INTO `startup_log_buildinfo` (`ID`, `version`, `gitVersion`, `targetMinOS`, `allocator`, `javascriptEngine`, `sysInfo`, `openssl_fk`, `buildEnvironment_fk`, `bits`, `debug`, `maxBsonObjectSize`)
    VALUES
        (6, '8.0.4', 'bc35ab4305d9920d9d0491c1c9ef9b72383d31f9', 'Windows 7/Windows Server 2008 R2', 'tcmalloc-gperf', 'mozjs', 'deprecated', 6, 6, 64, FALSE, 16777216);

INSERT INTO `startup_log_cmdLine_net` (`ID`, `bindIp`, `port`)
    VALUES
        (6, '127.0.0.1', 27017);

INSERT INTO `startup_log_cmdLine_storage` (`ID`, `dbPath`)
    VALUES
        (6, 'C:\\Program Files\\MongoDB\\Server\\8.0\\data');

INSERT INTO `startup_log_cmdLine_systemLog` (`ID`, `destination`, `logAppend`, `path`)
    VALUES
        (6, 'file', TRUE, 'C:\\Program Files\\MongoDB\\Server\\8.0\\log\\mongod.log');

INSERT INTO `startup_log_cmdLine` (`ID`, `config`, `net_fk`, `service`, `storage_fk`, `systemLog_fk`)
    VALUES
        (6, 'C:\\Program Files\\MongoDB\\Server\\8.0\\bin\\mongod.cfg', 6, TRUE, 6, 6);

INSERT INTO `startup_log` (`ID`, `_id`, `hostname`, `startTime`, `startTimeLocal`, `cmdLine_fk`, `pid`, `buildinfo_fk`)
    VALUES
        (6, 'DESKTOP-HRB44I9-1741986554510', 'DESKTOP-HRB44I9', '2025-03-14 21:09:14.000000', 'Fri Mar 14 16:09:14.510', 6, 9604, 6);

INSERT INTO `startup_log_buildinfo_versionArray` (`ID`, `parent_fk`, `INDEX`, `Int32`)
    VALUES
        (24, 6, 0, 8);

INSERT INTO `startup_log_buildinfo_versionArray` (`ID`, `parent_fk`, `INDEX`, `Int32`)
    VALUES
        (25, 6, 1, 0);

INSERT INTO `startup_log_buildinfo_versionArray` (`ID`, `parent_fk`, `INDEX`, `Int32`)
    VALUES
        (26, 6, 2, 4);

INSERT INTO `startup_log_buildinfo_versionArray` (`ID`, `parent_fk`, `INDEX`, `Int32`)
    VALUES
        (27, 6, 3, 0);

INSERT INTO `startup_log_buildinfo_storageEngines` (`ID`, `parent_fk`, `INDEX`, `String`)
    VALUES
        (12, 6, 0, 'devnull');

INSERT INTO `startup_log_buildinfo_storageEngines` (`ID`, `parent_fk`, `INDEX`, `String`)
    VALUES
        (13, 6, 1, 'wiredTiger');


-- { _id: DESKTOP-HRB44I9-1742344600892 }
INSERT INTO `startup_log_buildinfo_buildEnvironment` (`ID`, `distmod`, `distarch`, `cc`, `ccflags`, `cxx`, `cxxflags`, `linkflags`, `target_arch`, `target_os`, `cppdefines`)
    VALUES
        (7, 'windows', 'x86_64', 'cl: Microsoft (R) C/C++ Optimizing Compiler Version 19.31.31107 for x64', '/nologo /WX /FImongo/platform/basic.h /fp:strict /EHsc /W3 /wd4068 /wd4244 /wd4267 /wd4290 /wd4351 /wd4355 /wd4373 /wd4800 /wd4251 /wd4291 /we4013 /we4099 /we4930 /errorReport:none /MD /O2 /Oy- /bigobj /utf-8 /permissive- /Zc:__cplusplus /Zc:sizedDealloc /volatile:iso /diagnostics:caret /std:c++20 /Gw /Gy /Zc:inline', 'cl: Microsoft (R) C/C++ Optimizing Compiler Version 19.31.31107 for x64', '/TP', '/nologo /DEBUG /INCREMENTAL:NO /LARGEADDRESSAWARE /OPT:REF', 'x86_64', 'windows', 'SAFEINT_USE_INTRINSICS 0 PCRE2_STATIC NDEBUG BOOST_ALL_NO_LIB _UNICODE UNICODE _SILENCE_CXX17_ALLOCATOR_VOID_DEPRECATION_WARNING _SILENCE_CXX17_OLD_ALLOCATOR_MEMBERS_DEPRECATION_WARNING _SILENCE_CXX17_CODECVT_HEADER_DEPRECATION_WARNING _SILENCE_ALL_CXX20_DEPRECATION_WARNINGS _CONSOLE _CRT_SECURE_NO_WARNINGS _ENABLE_EXTENDED_ALIGNED_STORAGE _SCL_SECURE_NO_WARNINGS _WIN32_WINNT 0x0A00 BOOST_USE_WINAPI_VERSION 0x0A00 NTDDI_VERSION 0x0A000000 ABSL_FORCE_ALIGNED_ACCESS BOOST_ENABLE_ASSERT_DEBUG_HANDLER BOOST_FILESYSTEM_NO_CXX20_ATOMIC_REF BOOST_LOG_NO_SHORTHAND_NAMES BOOST_LOG_USE_NATIVE_SYSLOG BOOST_LOG_WITHOUT_THREAD_ATTR BOOST_MATH_NO_LONG_DOUBLE_MATH_FUNCTIONS BOOST_SYSTEM_NO_DEPRECATED BOOST_THREAD_USES_DATETIME BOOST_THREAD_VERSION 5');

INSERT INTO `startup_log_buildinfo_openssl` (`ID`, `running`)
    VALUES
        (7, 'Windows SChannel');

INSERT INTO `startup_log_buildinfo` (`ID`, `version`, `gitVersion`, `targetMinOS`, `allocator`, `javascriptEngine`, `sysInfo`, `openssl_fk`, `buildEnvironment_fk`, `bits`, `debug`, `maxBsonObjectSize`)
    VALUES
        (7, '8.0.4', 'bc35ab4305d9920d9d0491c1c9ef9b72383d31f9', 'Windows 7/Windows Server 2008 R2', 'tcmalloc-gperf', 'mozjs', 'deprecated', 7, 7, 64, FALSE, 16777216);

INSERT INTO `startup_log_cmdLine_net` (`ID`, `bindIp`, `port`)
    VALUES
        (7, '127.0.0.1', 27017);

INSERT INTO `startup_log_cmdLine_storage` (`ID`, `dbPath`)
    VALUES
        (7, 'C:\\Program Files\\MongoDB\\Server\\8.0\\data');

INSERT INTO `startup_log_cmdLine_systemLog` (`ID`, `destination`, `logAppend`, `path`)
    VALUES
        (7, 'file', TRUE, 'C:\\Program Files\\MongoDB\\Server\\8.0\\log\\mongod.log');

INSERT INTO `startup_log_cmdLine` (`ID`, `config`, `net_fk`, `service`, `storage_fk`, `systemLog_fk`)
    VALUES
        (7, 'C:\\Program Files\\MongoDB\\Server\\8.0\\bin\\mongod.cfg', 7, TRUE, 7, 7);

INSERT INTO `startup_log` (`ID`, `_id`, `hostname`, `startTime`, `startTimeLocal`, `cmdLine_fk`, `pid`, `buildinfo_fk`)
    VALUES
        (7, 'DESKTOP-HRB44I9-1742344600892', 'DESKTOP-HRB44I9', '2025-03-19 00:36:40.000000', 'Tue Mar 18 19:36:40.892', 7, 5220, 7);

INSERT INTO `startup_log_buildinfo_versionArray` (`ID`, `parent_fk`, `INDEX`, `Int32`)
    VALUES
        (28, 7, 0, 8);

INSERT INTO `startup_log_buildinfo_versionArray` (`ID`, `parent_fk`, `INDEX`, `Int32`)
    VALUES
        (29, 7, 1, 0);

INSERT INTO `startup_log_buildinfo_versionArray` (`ID`, `parent_fk`, `INDEX`, `Int32`)
    VALUES
        (30, 7, 2, 4);

INSERT INTO `startup_log_buildinfo_versionArray` (`ID`, `parent_fk`, `INDEX`, `Int32`)
    VALUES
        (31, 7, 3, 0);

INSERT INTO `startup_log_buildinfo_storageEngines` (`ID`, `parent_fk`, `INDEX`, `String`)
    VALUES
        (14, 7, 0, 'devnull');

INSERT INTO `startup_log_buildinfo_storageEngines` (`ID`, `parent_fk`, `INDEX`, `String`)
    VALUES
        (15, 7, 1, 'wiredTiger');

