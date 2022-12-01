--
-- PostgreSQL database dump
--

-- Dumped from database version 12.2
-- Dumped by pg_dump version 12.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: minidb; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA minidb;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: dr18_allwise; Type: TABLE; Schema: minidb; Owner: -
--

CREATE TABLE minidb.dr18_allwise (
----------------------------------------------------------------------
--/H ALLWISE catalog: https://wise2.ipac.caltech.edu/docs/release/allwise/. For detailed descriptions of the columns see: https://wise2.ipac.caltech.edu/docs/release/allwise/expsup/sec2_1a.html
----------------------------------------------------------------------
    designation character(20), --/D Sexagesimal, equatorial position-based source name 
    ra numeric(10,7), --/U degrees --/D J2000 right ascension 
    "dec" numeric(9,7), --/U degrees --/D J2000 declination 
    sigra numeric(7,4), --/U arcsec --/D One-sigma uncertainty in right ascension coordinate 
    sigdec numeric(7,4), --/U arcsec --/D One-sigma uncertainty in declination coordinate 
    sigradec numeric(8,4), --/U arcsec --/D The co-sigma of the equatorial position uncertainties 
    glon numeric(10,7), --/U degrees --/D Galactic longitude 
    glat numeric(9,7), --/U degrees --/D Galactic latitude 
    elon numeric(10,7), --/U degrees --/D Ecliptic longitude 
    elat numeric(9,7), --/U degrees --/D Ecliptic latitude 
    wx numeric(7,3), --/U pixel --/D The x-pixel coordinate of this source on the WISE Atlas Image 
    wy numeric(7,3), --/U pixel --/D The y-pixel coordinate of this source on the WISE Atlas Image 
    cntr bigint NOT NULL, --/D Unique identification number for this object in the AllWISE Catalog/Reject Table 
    source_id character(28), --/D Unique source ID 
    coadd_id character(20), --/D WISE Atlas Tile identifier from which source was extracted 
    src integer, --/D Sequential number of the source extraction in the WISE Atlas Tile from which this source detected and measured 
    w1mpro numeric(5,3), --/U mag --/D W1 magnitude measured with profile-fitting photometry 
    w1sigmpro numeric(4,3), --/U mag --/D W1 profile-fit photometric measurement uncertainty 
    w1snr numeric(7,1), --/D W1 profile-fit measurement signal-to-noise ratio 
    w1rchi2 real, --/D Reduced chi^2 of the W1 profile-fit photometry measurement 
    w2mpro numeric(5,3), --/U mag --/D W2 magnitude measured with profile-fitting photometry 
    w2sigmpro numeric(4,3), --/U mag --/D W2 profile-fit photometric measurement uncertainty 
    w2snr numeric(7,1), --/D W2 profile-fit measurement signal-to-noise ratio 
    w2rchi2 real, --/D Reduced chi^2 of the W2 profile-fit photometry measurement 
    w3mpro numeric(5,3), --/U mag --/D W3 magnitude measured with profile-fitting photometry 
    w3sigmpro numeric(4,3), --/U mag --/D W3 profile-fit photometric measurement uncertainty 
    w3snr numeric(7,1), --/D W3 profile-fit measurement signal-to-noise ratio 
    w3rchi2 real, --/D Reduced chi^2 of the W3 profile-fit photometry measurement 
    w4mpro numeric(5,3), --/U mag --/D W4 magnitude measured with profile-fitting photometry 
    w4sigmpro numeric(4,3), --/U mag --/D W4 profile-fit photometric measurement uncertainty 
    w4snr numeric(7,1), --/D W4 profile-fit measurement signal-to-noise ratio 
    w4rchi2 real, --/D Reduced chi^2 of the W4 profile-fit photometry measurement 
    rchi2 real, --/D Combined reduced chi^2 in all bands for the profile-fit photometry measurement 
    nb integer, --/D Number of PSF components used simultaneously in the profile-fitting for this source 
    na integer, --/D Active deblending flag 
    w1sat numeric(4,3), --/D Fraction of all pixels within the profile-fitting area for W1 images that are flagged as saturated 
    w2sat numeric(4,3), --/D Fraction of all pixels within the profile-fitting area for W2 images that are flagged as saturated 
    w3sat numeric(4,3), --/D Fraction of all pixels within the profile-fitting area for W3 images that are flagged as saturated 
    w4sat numeric(4,3), --/D Fraction of all pixels within the profile-fitting area for W4 images that are flagged as saturated 
    satnum character(4), --/D Minimum sample at which saturation occurs in each band 
    ra_pm numeric(10,7), --/U degrees --/D Right ascension at epoch MJD=55400.0 (2010.5589) from the profile-fitting measurement model that includes motion 
    dec_pm numeric(9,7), --/U degrees --/D Declination at epoch MJD=55400.0 (2010.5589) from the profile-fitting measurement model that includes motion 
    sigra_pm numeric(7,4), --/U arcsec --/D One-sigma uncertainty in right ascension from the profile-fitting measurement model that includes motion 
    sigdec_pm numeric(7,4), --/U arcsec --/D One-sigma uncertainty in declination from the profile-fitting measurement model that includes motion 
    sigradec_pm numeric(8,4), --/U arcsec --/D The co-sigma of the equatorial position uncertainties from the profile-fitting measurement model that includes motion 
    pmra integer, --/U mas/yr --/D Total apparent motion in right ascension estimated for this source 
    sigpmra integer, --/U mas/yr --/D Uncertainty in the total right ascension motion estimation 
    pmdec integer, --/U mas/yr --/D Total apparent motion in declination estimated for this source 
    sigpmdec integer, --/U mas/yr --/D Uncertainty in the total declination motion estimation 
    w1rchi2_pm real, --/D Reduced chi^2 of the W1 profile-fit photometry measurement including motion estimation 
    w2rchi2_pm real, --/D Reduced chi^2 of the W2 profile-fit photometry measurement including motion estimation 
    w3rchi2_pm real, --/D Reduced chi^2 of the W3 profile-fit photometry measurement including motion estimation 
    w4rchi2_pm real, --/D Reduced chi^2 of the W4 profile-fit photometry measurement including motion estimation 
    rchi2_pm real, --/D Combined reduced chi^2 in all bands for the profile-fit photometry measurement including motion estimation 
    pmcode character(5), --/D string that encodes information about factors that impact the accuracy of the motion estimation 
    cc_flags character(4), --/D Contamination and confusion flag 
    rel character(1), --/D Small-separation, same-Tile detection flag 
    ext_flg integer, --/D Extended source flag 
    var_flg character(4), --/D Variability flag 
    ph_qual character(4), --/D Photometric quality flag 
    det_bit integer, --/D Bit-encoded integer indicating bands in which a source has a w#snr>2 detection 
    moon_lev character(4), --/D Scattered moonlight contamination flag 
    w1nm integer, --/D number of individual 7.7s exposures where this source was detected with SNR>3 in the W1 profile-fit measurement 
    w1m integer, --/D number of individual 7.7s W1 exposures on which a profile-fit measurement of this source was possible 
    w2nm integer, --/D number of individual 7.7s exposures where this source was detected with SNR>3 in the W2 profile-fit measurement 
    w2m integer, --/D number of individual 7.7s W2 exposures on which a profile-fit measurement of this source was possible 
    w3nm integer, --/D number of individual 7.7s exposures where this source was detected with SNR>3 in the W3 profile-fit measurement 
    w3m integer, --/D number of individual 7.7s W3 exposures on which a profile-fit measurement of this source was possible 
    w4nm integer, --/D number of individual 7.7s exposures where this source was detected with SNR>3 in the W4 profile-fit measurement 
    w4m integer, --/D number of individual 7.7s W4 exposures on which a profile-fit measurement of this source was possible 
    w1cov numeric(6,3), --/D Mean pixel coverage in W1 
    w2cov numeric(6,3), --/D Mean pixel coverage in W2 
    w3cov numeric(6,3), --/D Mean pixel coverage in W3 
    w4cov numeric(6,3), --/D Mean pixel coverage in W4 
    w1cc_map integer, --/D Contamination and confusion map for this source in W1 
    w1cc_map_str character(9), --/D Contamination and confusion string denoting all artifacts that may contaminate the W1 measurement of this source 
    w2cc_map integer, --/D Contamination and confusion map for this source in W2 
    w2cc_map_str character(9), --/D Contamination and confusion string denoting all artifacts that may contaminate the W2 measurement of this source 
    w3cc_map integer, --/D Contamination and confusion map for this source in W3 
    w3cc_map_str character(9), --/D Contamination and confusion string denoting all artifacts that may contaminate the W3 measurement of this source 
    w4cc_map integer, --/D Contamination and confusion map for this source in W4 
    w4cc_map_str character(9), --/D Contamination and confusion string denoting all artifacts that may contaminate the W4 measurement of this source 
    best_use_cntr bigint, --/D Cntr identification value of the source extraction 
    ngrp smallint, --/D Excess number of positionally associated duplicate resolution groups that included this source 
    w1flux real, --/U dn --/D "Raw" W1 source flux measured in profile-fit photometry 
    w1sigflux real, --/U dn --/D Uncertainty in the "raw" W1 source flux measurement in profile-fit photometry 
    w1sky numeric(8,3), --/U dn --/D Average of the W1 sky background value  
    w1sigsk numeric(6,3), --/U dn --/D Uncertainty in the W1 sky background value 
    w1conf numeric(8,3), --/U dn --/D Estimated confusion noise in the W1 sky background annulus 
    w2flux real, --/U dn --/D "Raw" W2 source flux measured in profile-fit photometry 
    w2sigflux real, --/U dn --/D Uncertainty in the "raw" W2 source flux measurement in profile-fit photometry 
    w2sky numeric(8,3), --/U dn --/D Average of the W2 sky background value  
    w2sigsk numeric(6,3), --/U dn --/D Uncertainty in the W2 sky background value 
    w2conf numeric(8,3), --/U dn --/D Estimated confusion noise in the W2 sky background annulus 
    w3flux real, --/U dn --/D "Raw" W3 source flux measured in profile-fit photometry 
    w3sigflux real, --/U dn --/D Uncertainty in the "raw" W3 source flux measurement in profile-fit photometry 
    w3sky numeric(8,3), --/U dn --/D Average of the W3 sky background value  
    w3sigsk numeric(6,3), --/U dn --/D Uncertainty in the W3 sky background value 
    w3conf numeric(8,3), --/U dn --/D Estimated confusion noise in the W3 sky background annulus 
    w4flux real, --/U dn --/D "Raw" W4 source flux measured in profile-fit photometry 
    w4sigflux real, --/U dn --/D Uncertainty in the "raw" W4 source flux measurement in profile-fit photometry 
    w4sky numeric(8,3), --/U dn --/D Average of the W4 sky background value  
    w4sigsk numeric(6,3), --/U dn --/D Uncertainty in the W4 sky background value 
    w4conf numeric(8,3), --/U dn --/D Estimated confusion noise in the W4 sky background annulus 
    w1mag numeric(5,3), --/U mag --/D W1 "standard" aperture magnitude 
    w1sigm numeric(4,3), --/U mag --/D Uncertainty in the W1 "standard" aperture magnitude 
    w1flg integer, --/D W1 "standard" aperture measurement quality flag 
    w1mcor numeric(4,3), --/U mag --/D W1 aperture curve-of-growth correction 
    w2mag numeric(5,3), --/U mag --/D W2 "standard" aperture magnitude 
    w2sigm numeric(4,3), --/D Uncertainty in the W2 "standard" aperture magnitude
    w2flg integer, --/D W2 "standard" aperture measurement quality flag
    w2mcor numeric(4,3), --/D W2 aperture curve-of-growth correction
    w3mag numeric(5,3), --/U mag --/D W3 "standard" aperture magnitude 
    w3sigm numeric(4,3), --/U mag --/D Uncertainty in the W3 "standard" aperture magnitude 
    w3flg integer, --/D W3 "standard" aperture measurement quality flag 
    w3mcor numeric(4,3), --/U mag --/D W3 aperture curve-of-growth correction 
    w4mag numeric(5,3), --/U mag --/D W4 "standard" aperture magnitude 
    w4sigm numeric(4,3), --/U mag --/D Uncertainty in the W4 "standard" aperture magnitude 
    w4flg integer, --/D W4 "standard" aperture measurement quality flag 
    w4mcor numeric(4,3), --/U mag --/D W4 aperture curve-of-growth correction 
    w1mag_1 numeric(5,3), --/U mag --/D W1 5.5" radius aperture magnitude 
    w1sigm_1 numeric(4,3), --/U mag --/D Uncertainty in the W1 5.5" radius aperture magnitude 
    w1flg_1 integer, --/D W1 5.5" radius aperture magnitude quality flag 
    w2mag_1 numeric(5,3), --/U mag --/D W2 5.5" radius aperture magnitude 
    w2sigm_1 numeric(4,3), --/U mag --/D Uncertainty in the W2 5.5" radius aperture magnitude 
    w2flg_1 integer, --/D W2 5.5" radius aperture magnitude quality flag 
    w3mag_1 numeric(5,3), --/U mag --/D W3 5.5" radius aperture magnitude 
    w3sigm_1 numeric(4,3), --/U mag --/D Uncertainty in the W3 5.5" radius aperture magnitude 
    w3flg_1 integer, --/D W3 5.5" radius aperture magnitude quality flag 
    w4mag_1 numeric(5,3), --/U mag --/D W4 11.0" radius aperture magnitude 
    w4sigm_1 numeric(4,3), --/U mag --/D Uncertainty in the W4 11.0" radius aperture magnitude 
    w4flg_1 integer, --/D W4 11.0" radius aperture magnitude quality flag 
    w1mag_2 numeric(5,3), --/U mag --/D W1 8.25" radius aperture magnitude 
    w1sigm_2 numeric(4,3), --/U mag --/D Uncertainty in the W1 8.25" radius aperture magnitude 
    w1flg_2 integer, --/D W1 8.25" radius aperture magnitude quality flag 
    w2mag_2 numeric(5,3), --/U mag --/D W2 8.25" radius aperture magnitude 
    w2sigm_2 numeric(4,3), --/U mag --/D Uncertainty in the W2 8.25" radius aperture magnitude 
    w2flg_2 integer, --/D W2 8.25" radius aperture magnitude quality flag 
    w3mag_2 numeric(5,3), --/U mag --/D W3 8.25" radius aperture magnitude 
    w3sigm_2 numeric(4,3), --/U mag --/D Uncertainty in the W3 8.25" radius aperture magnitude 
    w3flg_2 integer, --/D W3 8.25" radius aperture magnitude quality flag 
    w4mag_2 numeric(5,3), --/U mag --/D W4 16.5" radius aperture magnitude 
    w4sigm_2 numeric(4,3), --/U mag --/D Uncertainty in the W4 16.5" radius aperture magnitude 
    w4flg_2 integer, --/D W4 16.5" radius aperture magnitude quality flag 
    w1mag_3 numeric(5,3), --/U mag --/D W1 11.0" radius aperture magnitude 
    w1sigm_3 numeric(4,3), --/U mag --/D Uncertainty in the W1 11.0" radius aperture magnitude 
    w1flg_3 integer, --/D W1 11.0" radius aperture magnitude quality flag 
    w2mag_3 numeric(5,3), --/U mag --/D W2 11.0" radius aperture magnitude 
    w2sigm_3 numeric(4,3), --/U mag --/D Uncertainty in the W2 11.0" radius aperture magnitude 
    w2flg_3 integer, --/D W2 11.0" radius aperture magnitude quality flag 
    w3mag_3 numeric(5,3), --/U mag --/D W3 11.0" radius aperture magnitude 
    w3sigm_3 numeric(4,3), --/U mag --/D Uncertainty in the W3 11.0" radius aperture magnitude 
    w3flg_3 integer, --/D W3 11.0" radius aperture magnitude quality flag 
    w4mag_3 numeric(5,3), --/U mag --/D W4 22.0" radius aperture magnitude 
    w4sigm_3 numeric(4,3), --/U mag --/D Uncertainty in the W4 22.0" radius aperture magnitude 
    w4flg_3 integer, --/D W4 22.0" radius aperture magnitude quality flag 
    w1mag_4 numeric(5,3), --/U mag --/D W1 13.75" radius aperture magnitude 
    w1sigm_4 numeric(4,3), --/U mag --/D Uncertainty in the W1 13.75" radius aperture magnitude 
    w1flg_4 integer, --/D W1 13.75" radius aperture magnitude quality flag 
    w2mag_4 numeric(5,3), --/U mag --/D W2 13.75" radius aperture magnitude 
    w2sigm_4 numeric(4,3), --/U mag --/D Uncertainty in the W2 13.75" radius aperture magnitude 
    w2flg_4 integer, --/D W2 13.75" radius aperture magnitude quality flag 
    w3mag_4 numeric(5,3), --/U mag --/D W3 13.75" radius aperture magnitude 
    w3sigm_4 numeric(4,3), --/U mag --/D Uncertainty in the W3 13.75" radius aperture magnitude 
    w3flg_4 integer, --/D W3 13.75" radius aperture magnitude quality flag 
    w4mag_4 numeric(5,3), --/U mag --/D W4 27.5" radius aperture magnitude 
    w4sigm_4 numeric(4,3), --/U mag --/D Uncertainty in the W4 27.5" radius aperture magnitude 
    w4flg_4 integer, --/D W4 27.5" radius aperture magnitude quality flag 
    w1mag_5 numeric(5,3), --/U mag --/D W1 16.5" radius aperture magnitude 
    w1sigm_5 numeric(4,3), --/U mag --/D Uncertainty in the W1 16.5" radius aperture magnitude 
    w1flg_5 integer, --/D W1 16.5" radius aperture magnitude quality flag 
    w2mag_5 numeric(5,3), --/U mag --/D W2 16.5" radius aperture magnitude 
    w2sigm_5 numeric(4,3), --/U mag --/D Uncertainty in the W2 16.5" radius aperture magnitude 
    w2flg_5 integer, --/D W2 16.5" radius aperture magnitude quality flag 
    w3mag_5 numeric(5,3), --/U mag --/D W3 16.5" radius aperture magnitude 
    w3sigm_5 numeric(4,3), --/U mag --/D Uncertainty in the W3 16.5" radius aperture magnitude 
    w3flg_5 integer, --/D W3 16.5" radius aperture magnitude quality flag 
    w4mag_5 numeric(5,3), --/U mag --/D W4 33.0" radius aperture magnitude 
    w4sigm_5 numeric(4,3), --/U mag --/D Uncertainty in the W4 33.0" radius aperture magnitude 
    w4flg_5 integer, --/D W4 33.0" radius aperture magnitude quality flag 
    w1mag_6 numeric(5,3), --/U mag --/D W1 19.25" radius aperture magnitude 
    w1sigm_6 numeric(4,3), --/U mag --/D Uncertainty in the W1 19.25" radius aperture magnitude 
    w1flg_6 integer, --/D W1 19.25" radius aperture magnitude quality flag 
    w2mag_6 numeric(5,3), --/U mag --/D W2 19.25" radius aperture magnitude 
    w2sigm_6 numeric(4,3), --/U mag --/D Uncertainty in the W2 19.25" radius aperture magnitude 
    w2flg_6 integer, --/D W2 19.25" radius aperture magnitude quality flag 
    w3mag_6 numeric(5,3), --/U mag --/D W3 19.25" radius aperture magnitude 
    w3sigm_6 numeric(4,3), --/U mag --/D Uncertainty in the W3 19.25" radius aperture magnitude 
    w3flg_6 integer, --/D W3 19.25" radius aperture magnitude quality flag 
    w4mag_6 numeric(5,3), --/U mag --/D W4 38.5" radius aperture magnitude 
    w4sigm_6 numeric(4,3), --/U mag --/D Uncertainty in the W4 38.5" radius aperture magnitude 
    w4flg_6 integer, --/D W4 38.5" radius aperture magnitude quality flag 
    w1mag_7 numeric(5,3), --/U mag --/D W1 22.0" radius aperture magnitude 
    w1sigm_7 numeric(4,3), --/U mag --/D Uncertainty in the W1 22.0" radius aperture magnitude 
    w1flg_7 integer, --/D W1 22.0" radius aperture magnitude quality flag 
    w2mag_7 numeric(5,3), --/U mag --/D W2 22.0" radius aperture magnitude 
    w2sigm_7 numeric(4,3), --/U mag --/D Uncertainty in the W2 22.0" radius aperture magnitude 
    w2flg_7 integer, --/D W2 22.0" radius aperture magnitude quality flag 
    w3mag_7 numeric(5,3), --/U mag --/D W3 22.0" radius aperture magnitude 
    w3sigm_7 numeric(4,3), --/U mag --/D Uncertainty in the W3 22.0" radius aperture magnitude 
    w3flg_7 integer, --/D W3 22.0" radius aperture magnitude quality flag 
    w4mag_7 numeric(5,3), --/U mag --/D W4 44.0" radius aperture magnitude 
    w4sigm_7 numeric(4,3), --/U mag --/D Uncertainty in the W4 44.0" radius aperture magnitude 
    w4flg_7 integer, --/D W4 44.0" radius aperture magnitude quality flag 
    w1mag_8 numeric(5,3), --/U mag --/D W1 24.75" radius aperture magnitude 
    w1sigm_8 numeric(4,3), --/U mag --/D Uncertainty in the W1 24.75" radius aperture magnitude 
    w1flg_8 integer, --/D W1 24.75" radius aperture magnitude quality flag 
    w2mag_8 numeric(5,3), --/U mag --/D W2 24.75" radius aperture magnitude 
    w2sigm_8 numeric(4,3), --/U mag --/D Uncertainty in the W2 24.75" radius aperture magnitude 
    w2flg_8 integer, --/D W3 24.75" radius aperture magnitude quality flag 
    w3mag_8 numeric(5,3), --/U mag --/D W3 24.75" radius aperture magnitude 
    w3sigm_8 numeric(4,3), --/U mag --/D Uncertainty in the W3 24.75" radius aperture magnitude 
    w3flg_8 integer, --/D W3 24.75" radius aperture magnitude quality flag 
    w4mag_8 numeric(5,3), --/U mag --/D W4 49.5" radius aperture magnitude 
    w4sigm_8 numeric(4,3), --/U mag --/D Uncertainty in the W4 49.5" radius aperture magnitude 
    w4flg_8 integer, --/D W4 49.5" radius aperture magnitude quality flag 
    w1magp numeric(5,3), --/U mag --/D Magnitude computed from the inverse-variance-weighted mean of the profile-fit flux measurements on the w1m W1 frames covering this source 
    w1sigp1 numeric(5,3), --/U mag --/D Standard deviation of the population of W1 fluxes measured on the w1m individual frames covering this source 
    w1sigp2 numeric(5,3), --/U mag --/D w1sigp1/sqrt(w1m) 
    w1k numeric(4,3), --/D Stetson K variability index computed using the W1 profile-fit fluxes measured on the single-exposure images 
    w1ndf integer, --/D Number of degrees of freedom in the flux variability chi-square, W1 
    w1mlq numeric(4,2), --/D Probability measure that the source is variable in W1 flux 
    w1mjdmin numeric(13,8), --/D The earliest modified Julian Date (mJD) of the W1 single-exposures covering the source 
    w1mjdmax numeric(13,8), --/D The latest modified Julian Date (mJD) of the W1 single-exposures covering the source 
    w1mjdmean numeric(13,8), --/D The average modified Julian Date (mJD) of the W1 single-exposures covering the source 
    w2magp numeric(5,3), --/U mag --/D Magnitude computed from the inverse-variance-weighted mean of the profile-fit flux measurements on the w2m W2 frames covering this source 
    w2sigp1 numeric(5,3), --/U mag --/D Standard deviation of the population of W2 fluxes measured on the w2m individual frames covering this source 
    w2sigp2 numeric(5,3), --/U mag --/D w2sigp1/sqrt(w2m) 
    w2k numeric(4,3), --/D Stetson K variability index computed using the W2 profile-fit fluxes measured on the single-exposure images 
    w2ndf integer, --/D Number of degrees of freedom in the flux variability chi-square, W2 
    w2mlq numeric(4,2), --/D Probability measure that the source is variable in W2 flux 
    w2mjdmin numeric(13,8), --/D The earliest modified Julian Date (mJD) of the W2 single-exposures covering the source 
    w2mjdmax numeric(13,8), --/D The latest modified Julian Date (mJD) of the W2 single-exposures covering the source 
    w2mjdmean numeric(13,8), --/D The average modified Julian Date (mJD) of the W2 single-exposures covering the source 
    w3magp numeric(5,3), --/U mag --/D Magnitude computed from the inverse-variance-weighted mean of the profile-fit flux measurements on the w3m W3 frames covering this source 
    w3sigp1 numeric(5,3), --/U mag --/D Standard deviation of the population of W3 fluxes measured on the w3m individual frames covering this source 
    w3sigp2 numeric(5,3), --/U mag --/D w3sigp1/sqrt(w3m) 
    w3k numeric(4,3), --/D Stetson K variability index computed using the W3 profile-fit fluxes measured on the single-exposure images 
    w3ndf integer, --/D Number of degrees of freedom in the flux variability chi-square, W3 
    w3mlq numeric(4,2), --/D Probability measure that the source is variable in W3 flux 
    w3mjdmin numeric(13,8), --/D The earliest modified Julian Date (mJD) of the W3 single-exposures covering the source 
    w3mjdmax numeric(13,8), --/D The latest modified Julian Date (mJD) of the W3 single-exposures covering the source 
    w3mjdmean numeric(13,8), --/D The average modified Julian Date (mJD) of the W3 single-exposures covering the source 
    w4magp numeric(5,3), --/U mag --/D Magnitude computed from the inverse-variance-weighted mean of the profile-fit flux measurements on the w4m W4 frames covering this source 
    w4sigp1 numeric(5,3), --/U mag --/D Standard deviation of the population of W4 fluxes measured on the w4m individual frames covering this source 
    w4sigp2 numeric(5,3), --/U mag --/D w4sigp1/sqrt(w4m) 
    w4k numeric(4,3), --/D Stetson K variability index computed using the W4 profile-fit fluxes measured on the single-exposure images 
    w4ndf integer, --/D Number of degrees of freedom in the flux variability chi-square, W4 
    w4mlq numeric(4,2), --/D Probability measure that the source is variable in W4 flux 
    w4mjdmin numeric(13,8), --/D The earliest modified Julian Date (mJD) of the W4 single-exposures covering the source 
    w4mjdmax numeric(13,8), --/D The latest modified Julian Date (mJD) of the W4 single-exposures covering the source 
    w4mjdmean numeric(13,8), --/D The average modified Julian Date (mJD) of the W4 single-exposures covering the source 
    rho12 integer, --/U percent --/D The correlation coefficient between the W1 and W2 single-exposure flux measurements 
    rho23 integer, --/U percent --/D The correlation coefficient between the W2 and W3 single-exposure flux measurements 
    rho34 integer, --/U percent --/D The correlation coefficient between the W3 and W4 single-exposure flux measurements 
    q12 integer, --/D Correlation significance between W1 and W2 
    q23 integer, --/D Correlation significance between W2 and W3 
    q34 integer, --/D Correlation significance between W3 and W4 
    xscprox numeric(7,2), --/U arcsec --/D distance between the WISE source position and the position of a nearby 2MASS XSC source 
    w1rsemi numeric(7,2), --/U arcsec --/D Semi-major axis of the elliptical aperture used to measure source in W1 
    w1ba numeric(3,2), --/D Axis ratio (b/a) of the elliptical aperture used to measure source in W1 
    w1pa numeric(5,2), --/U degrees --/D Position angle of the elliptical aperture major axis used to measure source in W1 
    w1gmag numeric(5,3), --/U mag --/D W1 magnitude of source measured in the elliptical aperture described by w1rsemi, w1ba, and w1pa 
    w1gerr numeric(4,3), --/U mag --/D Uncertainty in the W1 magnitude of source measured in elliptical aperture 
    w1gflg integer, --/D W1 elliptical aperture measurement quality flag 
    w2rsemi numeric(7,2), --/U arcsec --/D Semi-major axis of the elliptical aperture used to measure source in W2 
    w2ba numeric(3,2), --/D Axis ratio (b/a) of the elliptical aperture used to measure source in W2 
    w2pa numeric(5,2), --/U degrees --/D Position angle of the elliptical aperture major axis used to measure source in W2 
    w2gmag numeric(5,3), --/D W2 magnitude of source measured in the elliptical aperture described by w2rsemi, w2ba, and w2pa
    w2gerr numeric(4,3), --/U mag --/D Uncertainty in the W2 magnitude of source measured in elliptical aperture 
    w2gflg integer, --/D W2 elliptical aperture measurement quality flag 
    w3rsemi numeric(7,2), --/U arcsec --/D Semi-major axis of the elliptical aperture used to measure source in W3 
    w3ba numeric(3,2), --/D Axis ratio (b/a) of the elliptical aperture used to measure source in W3 
    w3pa numeric(5,2), --/U degrees --/D Position angle of the elliptical aperture major axis used to measure source in W3 
    w3gmag numeric(5,3), --/D W3 magnitude of source measured in the elliptical aperture described by w3rsemi, w3ba, and w3pa
    w3gerr numeric(4,3), --/U mag --/D Uncertainty in the W3 magnitude of source measured in elliptical aperture 
    w3gflg integer, --/D W3 elliptical aperture measurement quality flag 
    w4rsemi numeric(7,2), --/U arcsec --/D Semi-major axis of the elliptical aperture used to measure source in W4 
    w4ba numeric(3,2), --/D Axis ratio (b/a) of the elliptical aperture used to measure source in W4 
    w4pa numeric(5,2), --/U degrees --/D Position angle of the elliptical aperture major axis used to measure source in W4 
    w4gmag numeric(5,3), --/D W4 magnitude of source measured in the elliptical aperture described by w4rsemi, w4ba, and w4pa
    w4gerr numeric(4,3), --/U mag --/D Uncertainty in the W4 magnitude of source measured in elliptical aperture 
    w4gflg integer, --/D W4 elliptical aperture measurement quality flag 
    tmass_key integer, --/D Unique identifier of the closest source in the 2MASS Point Source Catalog 
    r_2mass numeric(5,3), --/U arcsec --/D Distance separating the positions of the WISE source and associated 2MASS PSC source within 3" 
    pa_2mass numeric(4,1), --/U degrees --/D Position angle of the vector from the WISE source to the associated 2MASS PSC source 
    n_2mass integer, --/D The number of 2MASS PSC entries found within a 3" radius of the WISE source position 
    j_m_2mass numeric(5,3), --/U mag --/D 2MASS J-band magnitude or magnitude upper limit of the associated 2MASS PSC source 
    j_msig_2mass numeric(4,3), --/U mag --/D 2MASS J-band corrected photometric uncertainty of the associated 2MASS PSC source 
    h_m_2mass numeric(5,3), --/U mag --/D 2MASS H-band magnitude or magnitude upper limit of the associated 2MASS PSC source 
    h_msig_2mass numeric(4,3), --/U mag --/D 2MASS H-band corrected photometric uncertainty of the associated 2MASS PSC source 
    k_m_2mass numeric(5,3), --/U mag --/D 2MASS Ks-band magnitude or magnitude upper limit of the associated 2MASS PSC source 
    k_msig_2mass numeric(4,3), --/U mag --/D 2MASS Ks-band corrected photometric uncertainty of the associated 2MASS PSC source 
    x numeric(17,16), --/D Unit sphere position x value 
    y numeric(17,16), --/D Unit sphere position y value 
    z numeric(17,16), --/D Unit sphere position z value 
    spt_ind integer, --/D Level 7 HTM spatial index key 
    htm20 bigint --/D Level 20 HTM spatial index key 
);


--
-- Name: dr18_best_brightest; Type: TABLE; Schema: minidb; Owner: -
--

CREATE TABLE minidb.dr18_best_brightest (
----------------------------------------------------------------------
--/H Catalog from Kevin Schlaufman for the selection of bright metal-poor stars from the method of Schlaufman and Casey (2014): https://ui.adsabs.harvard.edu/abs/2014ApJ...797...13S/abstract. WISE values from WHICH CATALOG, 2MASS values from 2MASS point source catalog.
----------------------------------------------------------------------
    designation character varying(19), --/D 2MASS Designation 
    ra_1 double precision, --/U degrees --/D right ascension from the WISE catalog 
    dec_1 double precision, --/U degrees --/D declination from the WISE catalog 
    glon double precision, --/U degrees --/D Galactic longitude from WISE catalog 
    glat double precision, --/U degrees --/D Galactic latitude from the WISE catalog 
    w1mpro real, --/U mag --/D W1-band magnitude measured with profile-fitting photometry 
    w2mpro real, --/U mag --/D W2-band magnitude measured with profile-fitting photometry 
    w3mpro real, --/U mag --/D W3-band magnitude measured with profile-fitting photometry 
    w4mpro character varying(6), --/U mag --/D W4-band magnitude measured with profile-fitting photometry 
    pmra integer, --/U mas/yr --/D Gaia DR2 proper motion 
    pmdec integer, --/U mas/yr --/D Gaia DR2 proper motion 
    j_m_2mass real, --/U mag --/D 2MASS J=band magnitude 
    h_m_2mass real, --/U mag --/D 2MASS magnitude 
    k_m_2mass real, --/U mag --/D 2MASS magnitude 
    ra_2 double precision, --/U degrees --/D right ascension from the 2MASS catalog 
    raerr double precision, --/U degrees --/D uncertainty in right ascension from the 2MASS catalog 
    dec_2 double precision, --/D 2MASS coordinate?
    decerr double precision, --/D 2MASS coordinate?
    nobs integer,
    mobs integer,
    vjmag real, --/D APASS magnitude
    bjmag real, --/D APASS magnitude
    gmag real, --/D APASS magnitude
    rmag real, --/D APASS magnitude
    imag real, --/D APASS magnitude
    evjmag real, --/D APASS magnitude
    ebjmag real, --/D APASS magnitude
    egmag real, --/D APASS magnitude
    ermag real, --/D APASS magnitude
    eimag real, --/D APASS magnitude
    name integer,
    separation double precision,
    ebv real, --/D SFD dustmap
    version integer, --/D version 2 is high priiority, version 1 is low priority (see Schlaufman + Casey 2014 for definitions)
    original_ext_source_id character varying(16),
    cntr bigint NOT NULL
);


--
-- Name: dr18_bhm_csc_v2; Type: TABLE; Schema: minidb; Owner: -
--

CREATE TABLE minidb.dr18_bhm_csc_v2 (
----------------------------------------------------------------------
--/H CSC2 X-ray sources that have been matched
--/T separately to PanSTARRS-1, Gaia DR2, and 2MASS catalogs, using the programs NWAY <br>
--/T (Johannes Buchner; see: Salvato 2018, MN, 473, 4937) and Xmatch (Arnold Rots;
--/T see: <br>
--/T https://cxc.cfa.harvard.edu/csc/csc_crossmatches.html). Both are based on the
--/T Bayesian spatial <br>
--/T cross-matching algorithm developed by Budavari & Szalay (2008, ApJ 679, 301),
--/T but Xmatch <br>
--/T has the added capability of taking source extent and/or PSF into account. <br>
--/T Created March 2021 by Paul Green, Dong-Woo Kim, Arnold Rots and the CXC CatSci
--/T group.
----------------------------------------------------------------------
    cxoid text, --/D CSC2 Chandra ID
    xra double precision, --/U deg --/D RA of X-ray source from CSC2 
    xdec double precision, --/U deg --/D Dec of X-ray source from CSC2 
    pri smallint, --/D Priority (based on X-ray S/N)
    ocat text, --/D optical catalog code (P for PS1, G for Gaia)
    oid bigint, --/D object ID from optical catalog
    ora double precision, --/U deg --/D right ascension (2000) from optical catalog 
    odec double precision, --/U deg --/D declination (2000) from optical catalog 
    omag real, --/U mag --/D optical magnitude from optical catalog 
    omatchtype smallint, --/D X-ray/optical match type (1-4 definite/likely/multiple opt, multiple X)
    irid text, --/D object ID from 2MASS
    ra2m double precision, --/U deg --/D right ascension (2000) from 2MASS 
    dec2m double precision, --/U deg --/D declination (2000) from 2MASS 
    hmag real, --/U mag --/D H mag from 2MASS 
    irmatchtype smallint, --/D X-ray/IR match type (1-4 definite/likely/multiple opt, multiple X)
    lgal double precision, --/U deg --/D Galactic longitude (from X-ray position) 
    bgal double precision, --/U deg --/D Galactic latitude (from X-ray position) 
    logfx real, --/D log10 of X-ray cgs flux in xband 
    xband text, --/D X-ray bandpass for logfx, priority b,m,s,h,w
    xsn double precision, --/D X-ray S/N
    xflags integer, --/D concatenated X-ray source flags: extended,confused,piledup,variable,streak,saturated
    designation2m text, --/D 2MASS identifier (designation) derived from irid
    idg2 bigint, --/D Gaia DR2 source_id (derived from ocat, oid)
    idps bigint, --/D Pan-STARRS1 Object identifier (derived here from ocat+oid) - equivalent to ObjID in MAST database (https://outerspace.stsci.edu/display/PANSTARRS/PS1+Object+Identifiers), and to our panstarrs1.extid_hi_lo
    pk bigint NOT NULL --/D primary key of the database table
);


--
-- Name: dr18_bhm_efeds_veto; Type: TABLE; Schema: minidb; Owner: -
--

CREATE TABLE minidb.dr18_bhm_efeds_veto (
----------------------------------------------------------------------
--/H The BHM-SPIDERS eFEDS veto catalogue.
--/T A minimalist catalogue of 6300 science targets in the SPIDERS eFEDS field that
--/T received SDSS-IV spectroscopy during the March2020 SPIDERS observing run (and
--/T hence are not in SDSS-SpecObj-DR16). Many of these spectra have very low SNR and
--/T so we will want to observe them again, but we will take account of this in the
--/T Carton code. This is a subset (in both rows and columns) of the
--/T spAll-v5_13_1.fits idlspec2d pipeline product. The original data model for that
--/T file is here:
--/T https://data.sdss.org/datamodel/files/BOSS_SPECTRO_REDUX/RUN2D/spAll.html
----------------------------------------------------------------------
    programname character varying(5), --/D program name within a given survey
    chunk character varying(7), --/D Name of tiling chunk
    platesn2 real, --/D Overall (S/N)^2 measure for plate; minimum of all 4 cameras
    plate integer, --/D Plate ID
    tile integer, --/D Tile ID
    mjd integer, --/U days --/D MJD of (last) observation 
    fiberid integer, --/D Fiber ID (1-1000)
    run2d character varying(7), --/D idlspec 2D reduction version
    run1d character varying(7), --/D idlspec 1D reduction version
    plug_ra double precision, --/U deg --/D Object RA (drilled fiber position at expected epoch of observation) 
    plug_dec double precision, --/U deg --/D Object Dec (drilled fiber position at expected epoch of observation) 
    z_err real, --/D Redshift error based upon fit to chi^2 minimum; negative for invalid fit
    rchi2 real, --/D Reduced chi^2 for best fit
    dof integer, --/D Degrees of freedom for best fit
    rchi2diff real, --/D Difference in reduced chi^2 of best solution to 2nd best solution
    wavemin real, --/U Angstroms --/D Minimum observed (vacuum) wavelength for this object 
    wavemax real, --/U Angstroms --/D Maximum observed (vacuum) wavelength for this object 
    wcoverage real, --/D Amount of wavelength coverage in log-10(Angstroms)
    zwarning integer, --/D A flag bitmask set for bad data or redshift fits
    sn_median_all real, --/D Median S/N for all good pixels in all filters
    anyandmask integer, --/D Mask bits which are set if any pixels for an object's ANDMASK have that bit set
    anyormask integer, --/D Mask bits which are set if any pixels for an object's ORMASK have that bit set
    pk bigint NOT NULL --/D primary key in the database table
);


--
-- Name: dr18_bhm_rm_v0_2; Type: TABLE; Schema: minidb; Owner: -
--

CREATE TABLE minidb.dr18_bhm_rm_v0_2 (
----------------------------------------------------------------------
--/H Parent sample for the RM project, used to select confirmed and candidate quasar targets for the BHM-RM Program in SDSS-V. For more details please see Yang and Shen, (2022, https://ui.adsabs.harvard.edu/abs/2022arXiv220608989Y/abstract).
--/T This table contains all photometric objects detected in the COSMOS, SDSS-RM,
--/T XMM-LSS, CDFS, S-CVZ, and ELAIS-S1 fields., within a circular area of 10
--/T degree^2 from the field center. <br>
--/T Field center: Name     RA          DEC <br>
--/T               XMM-LSS  02:22:50.00    -04:45:00.0 <br>
--/T               CDFS     03:30:35.60    -28:06:00.0 <br>
--/T               EDFS     04:04:57.84    -48:25:22.8 <br>
--/T               ELAIS-S1 00:37:48.00    -44:00:00.0 <br>
--/T               COSMOS   10:00:00.00    +02:12:00.0 <br>
--/T               SDSS-RM  14:14:49.00    +53:05:00.0 <br>
--/T               S-CVZ    06:00:00.00    -66:33:38.0 <br>
--/T The table includes information from the following survey data releases: <br>
--/T DES: Dark Energy Survey, Y6, Y6A1_COADD_OBJECT_SUMMARY <br>
--/T PS1: Pan-STARRS, DR1, StackObjectThin <br>
--/T NSC: NOAO Source Catalog, DR1, nsc_dr1.object <br>
--/T SDSS: Sloan Digital Sky Survey, DR14, PhotoObjAll <br>
--/T Gaia: DR2, gaia_dr2.gaia_source <br>
--/T unWISE: DR1 <br>
--/T Near-infrared: LAS: UKIDSS Large Area Surveys (DR11), <br>
--/T                UHS: UKIRT Hemisphere Survey (DR1), <br>
--/T                VHS: VISTA Hemisphere Survey (DR6), <br>
--/T                Viking: VISTA Kilo-Degree Infrared Galaxy Survey (DR5), <br>
--/T                VIDEO: VISTA Deep Extragalactic Observations Survey (DR5), <br>
--/T                VMC: VISTA Magellanic Cloud Survey (DR4) <br>
--/T Values are set to -9.0 or -9 if null.
----------------------------------------------------------------------
    field_name character varying(8), --/D One of COSMOS, SDSS-RM, XMM-LSS, CDFS, S-CVZ, or ELAIS-S1
    ra double precision, --/U deg --/D Fiducial Right Ascension (J2000) 
    "dec" double precision, --/U deg --/D Fiducial Declination (J2000) 
    distance double precision, --/U deg --/D Angular distance from the field center 
    pos_ref character varying(4), --/D Fiducial coordinates reference, priority: Gaia > DES > PS1 > NSC
    ebv double precision, --/D Galactic E(B−V) reddening from Schlegel et al. (1998)
    des integer, --/D A flag set to 1 if in DES photometric catalog
    coadd_object_id bigint, --/D DES coadd object ID
    ra_des double precision, --/U deg --/D DES Right Ascension (J2000) 
    dec_des double precision, --/U deg --/D DES Declination (J2000) 
    extended_coadd integer, --/D DES type classifier: 0 (high-confidence stars), 1 (likely stars), 2 (mostly galaxies), and 3 (high-confidence galaxies)
    separation_des double precision, --/U arcsec --/D Angular distance between DES position and the fiducial coordinates 
    ps1 integer, --/D A flag set to 1 if in PS1 photometric catalog
    objid_ps1 bigint, --/D PS1 unique object identifier
    ra_ps1 double precision, --/U deg --/D PS1 right ascension from i filter stack detection 
    dec_ps1 double precision, --/U deg --/D PS1 declination from i filter stack detection 
    class_ps1 double precision, --/D PS1 source classification = iPsfMag - iKronMag
    separation_ps1 double precision, --/U arcsec --/D Angular distance between PS1 position and the fiducial coordinates 
    nsc integer, --/D A flag set to 1 if in  photometric catalog
    id_nsc bigint, --/D NSC unique object identifier
    ra_nsc double precision, --/U deg --/D Right Ascension (J2000) 
    dec_nsc double precision, --/U deg --/D Declination (J2000) 
    class_star double precision, --/D NSC Star/Galaxy classifier
    flags_nsc integer, --/D NSC SExtractor flag value
    separation_nsc double precision, --/U arcsec --/D Angular distance between NSC position and the fiducial coordinates 
    sdss integer, --/D A flag set to 1 if in SDSS photometric catalog
    objid_sdss bigint, --/D Unique SDSS identifier
    ra_sdss double precision, --/U deg --/D Right Ascension (J2000) 
    dec_sdss double precision, --/U deg --/D Declination (J2000) 
    type_sdss integer, --/D SDSS type classifier (star 6, galaxy 3, etc.)
    clean_sdss integer, --/D SDSS clean photometry flag (1=clean, 0=unclean)
    separation_sdss double precision, --/U arcsec --/D Angular distance between SDSS position and the fiducial coordinates 
    gaia integer, --/D A flag set to 1 if in Gaia DR2 photometric catalog
    source_id_gaia bigint, --/D Gaia DR2 unique source identifier
    mg double precision, --/U mag --/D Gaia g-band magnitude (phot_g_mean_mag in Gaia catalog, Vega) 
    parallax double precision, --/U mas --/D Parallax, Angle, 
    parallax_error double precision, --/U mas --/D Standard error of parallax, Angle, 
    plxsig double precision, --/D Parallax significance defined as |PARALLAX/PARALLAX_ERROR|
    pmra double precision, --/U mas/year --/D Proper motion in RA direction, Angular Velocity, 
    pmra_error double precision, --/U mas/year --/D Standard error of proper motion in RA direction, Angular Velocity, 
    pmdec double precision, --/U mas/year --/D Proper motion in DEC direction, Angular Velocity, 
    pmdec_error double precision, --/U mas/year --/D Standard error of proper motion in DEC direction, Angular Velocity, 
    pmsig double precision, --/D Proper motion significance defined as (pmra^2+pmdec^2)/sqrt(pmra^2*pmra_error^2 + pmdec^2*pmdec_error^2)
    unwise integer, --/D A flag set to 1 if in unWISE photometric catalog
    objid_unwise character varying(16), --/D unWISE unique object id
    ra_unwise double precision, --/U deg --/D unWISE Right Ascension (J2000) 
    dec_unwise double precision, --/U deg --/D unWISE Declination (J2000) 
    separation_unwise double precision, --/U arcsec --/D Angular distance between unWISE position and the fiducial coordinates 
    near_ir integer, --/D A flag set to 1 if in NIR photometric catalog
    survey_ir character varying(6), --/D Near-IR survey name: LAS, UHS, VHS, Viking, VMC, VIDEO
    sourceid_ir bigint, --/D NIR source identifier
    ra_ir double precision, --/U deg --/D NIR Right Ascension (J2000) 
    dec_ir double precision, --/U deg --/D NIR Declination (J2000) 
    separation_ir double precision, --/U arcsec --/D Angular distance between NIR position and the fiducial coordinates 
    optical_survey character varying(4), --/D Optical survey used in Skewt-QSO, e.g., DES, PS1, Gaia, NSC
    mi double precision, --/U mag --/D i-band PSF magnitude (galactic extinction not corrected) 
    cal_skewt_qso integer, --/D A flag indicates whether Skewt-QSO is calculated.(Set to 1 when Nband_Optical_use > 2.)
    nband_optical_use integer, --/D Number of optical bands used in Skewt-QSQ.
    use_unwise integer, --/D Set to 1 when unWISE photometry is used in Skewt-QSO calculation.
    use_nir integer, --/D Set to 1 when NIR photometry is usedin Skewt-QSO calculation.
    photo_combination character varying(17), --/D The photometric data combinations used in Skewt-QSO, for example, "DECam-YJHK-unWISE" - DECam/PS1 includes grizy bands; unWISE incldes unWISE W1 and W2 bands; and Gaia includes Gaia bp, g, and rp bands
    log_qso double precision, --/D The (natural) logarithmic probability of a target fitting to QSO colors convolved with a QLF. Set to -323 if log_QSO<-323 (close to the lower limit of double-precision data).
    log_star double precision, --/D The logarithmic probability of a target fitting to star colors multiplied by star number counts based on a stellar simulation. Set to -323 if log_Star<-323.
    log_galaxy double precision, --/D The logarithmic probability of a target fitting to galaxy colors convolved with a GLF. Set to -323 if  log_Galaxy<-323.
    p_qso double precision, --/D QSO probability from Skewt-QSO. P_QSO = exp(log_qso)/(exp(log_qso) + exp(log_star) + exp(log_galaxy))
    p_star real, --/D Star probability from Skewt-QSO.
    p_galaxy double precision, --/D Galaxy probability from Skewt-QSO.
    class_skewt_qso character varying(6), --/D Classification based on the highest probability from Skewt-QSO, QSO/Star/Galaxy
    skewt_qso integer, --/D flag indicating whether the object is a QSO (same as class_skewt_qso, except additionally requiring log_QSO>-10). (P_QSO>P_Star & P_QSO>P_galaxy & log_QSO>-10)
    p_qso_prior double precision, --/D QSO probability with prior probabilities from additional info, such as separation (between optical survey and unWISE), morphology, variability, and/or proper motion.(Note: *_Prior are generally not populated in this version, except for the "S-CVZ" field, where we take into account the separation between optical surveys and unWISE.)
    p_star_prior real, --/D Star probability with prior probabilities.
    p_galaxy_prior double precision, --/D Galaxy probability with prior probabilities.
    class_skewt_qso_prior character varying(6), --/D Classification based on Skewt-QSO with prior probabilities described above.
    skewt_qso_prior integer, --/D flag indicating whether the object is QSO based on Skewt-QSO with prior probabilities described above.
    photoz_qso double precision, --/D Photometric redshift of QSO from Skewt-QSO
    photoz_qso_lower double precision, --/D Lower limit of photoz_QSO
    photoz_qso_upper double precision, --/D Upper limit of photoz_QSO
    prob_photoz_qso double precision, --/D The total probability of z located between photoz_QSO_lower and photoz_QSO_upper (assuming it is QSO).
    photoz_galaxy double precision, --/D Photometric redshift of Galaxy from Skewt-QSO (fitting to galaxy colors).
    photoz_galaxy_lower double precision, --/D Lower limit of photoz_Galaxy.
    photoz_galaxy_upper double precision, --/D Upper limit of photoz_Galaxy.
    pqso_xdqso double precision, --/D QSO probability from the public XDQSO catalog
    photoz_xdqso double precision, --/D Photometric redshift of QSO from the public XDQSO catalog
    prob_rf_gaia_unwise double precision, --/D AGN probability from the Gaia-unWISE AGN catalog
    photoz_gaia_unwise double precision, --/D Photometric redshift from the Gaia-unWISE AGN catalog
    des_var_sn_max double precision, --/D The signal-to-noise ratio of the measured intrinsic RMS in grizy bands (DES).
    ps1_var_sn_max double precision, --/D The maximum signal-to-noise ratio of the measured intrinsic RMS over 5 bands (PS1).
    spec_q integer, --/D flag indicating if the object was spectroscopically confirmed as QSO from earlier surveys.
    spec_strmask character varying(6), --/D string format of spec_bitmask, e.g., '000001'.
    spec_bitmask bigint, --/D bitmask - bit 0: SDSS-DR14Q, bit 1: SDSS-DR7Q, bit 2: OzDES-DR1Q, bit 3: SDSS-RM_Q, bit 4: COSMOS_Q, bit 5: Milliquas_QA. (Note: Milliquas_QA=1 are objects spectroscopically classified as broad-line QSO/AGN in the Million Quasars (MILLIQUAS) catalog.)
    specz double precision, --/D spectroscopic redshift from multiple surveys. Priority: SDSS-RM_Q/COSMOS_Q > SDSS-DR14Q > SDSS-DR7Q > OzDES-DR1Q > Milliquas_QA
    specz_ref character varying(16), --/D Reference of specz.
    photo_q integer, --/D flag indicating if the object was selected as QSO in public photometric quasar catalogs.
    photo_strmask character varying(3), --/D string format of photo_bitmask
    photo_bitmask bigint, --/D bit mask, bit 0: XDQSO catalog, bit 1: Gaia-unWISE AGN catalog; bit 2: Milliquas_photo: photometric quasar candidates in the Milliquas catalog
    photoz double precision, --/D Photometric redshift from public photometric quasar catalogs. Priority: XDQSO > Gaia-unWISE > Milliquas_photo
    pqso_photo double precision, --/D QSO probability from public photometric quasar catalogs.
    photoz_ref character varying(16), --/D photoz reference.
    pk bigint NOT NULL, --/D primary key for the database table
    psfmag_des_g double precision, --/U mag --/D DES PSF photometry 
    psfmag_des_r double precision, --/U mag --/D DES PSF photometry 
    psfmag_des_i double precision, --/U mag --/D DES PSF photometry 
    psfmag_des_z double precision, --/U mag --/D DES PSF photometry 
    psfmag_des_y double precision, --/U mag --/D DES PSF photometry 
    psfmagerr_des_g double precision, --/U mag --/D DES PSF photometry error 
    psfmagerr_des_r double precision, --/U mag --/D DES PSF photometry error 
    psfmagerr_des_i double precision, --/U mag --/D DES PSF photometry error 
    psfmagerr_des_z double precision, --/U mag --/D DES PSF photometry error 
    psfmagerr_des_y double precision, --/U mag --/D DES PSF photometry error 
    mag_auto_des_g double precision, --/U mag --/D DES auto photometry 
    mag_auto_des_r double precision, --/U mag --/D DES auto photometry 
    mag_auto_des_i double precision, --/U mag --/D DES auto photometry 
    mag_auto_des_z double precision, --/U mag --/D DES auto photometry 
    mag_auto_des_y double precision, --/U mag --/D DES auto photometry 
    magerr_auto_des_g double precision, --/U mag --/D DES auto photometry error 
    magerr_auto_des_r double precision, --/U mag --/D DES auto photometry error 
    magerr_auto_des_i double precision, --/U mag --/D DES auto photometry error 
    magerr_auto_des_z double precision, --/U mag --/D DES auto photometry error 
    magerr_auto_des_y double precision, --/U mag --/D DES auto photometry error 
    imaflags_iso_g integer, --/D DES flag identifying sources with missing/flagged pixels, considering all single epoch images
    imaflags_iso_r integer, --/D DES flag identifying sources with missing/flagged pixels, considering all single epoch images
    imaflags_iso_i integer, --/D DES flag identifying sources with missing/flagged pixels, considering all single epoch images
    imaflags_iso_z integer, --/D DES flag identifying sources with missing/flagged pixels, considering all single epoch images
    imaflags_iso_y integer, --/D DES flag identifying sources with missing/flagged pixels, considering all single epoch images
    psfmag_ps1_g double precision, --/U mag --/D PS1 PSF magnitude 
    psfmag_ps1_r double precision, --/U mag --/D PS1 PSF magnitude 
    psfmag_ps1_i double precision, --/U mag --/D PS1 PSF magnitude 
    psfmag_ps1_z double precision, --/U mag --/D PS1 PSF magnitude 
    psfmag_ps1_y double precision, --/U mag --/D PS1 PSF magnitude 
    psfmagerr_ps1_g double precision, --/U mag --/D PS1 PSF magnitude error 
    psfmagerr_ps1_r double precision, --/U mag --/D PS1 PSF magnitude error 
    psfmagerr_ps1_i double precision, --/U mag --/D PS1 PSF magnitude error 
    psfmagerr_ps1_z double precision, --/U mag --/D PS1 PSF magnitude error 
    psfmagerr_ps1_y double precision, --/U mag --/D PS1 PSF magnitude error 
    kronmag_ps1_g double precision, --/U mag --/D PS1 Kron magnitude 
    kronmag_ps1_r double precision, --/U mag --/D PS1 Kron magnitude 
    kronmag_ps1_i double precision, --/U mag --/D PS1 Kron magnitude 
    kronmag_ps1_z double precision, --/U mag --/D PS1 Kron magnitude 
    kronmag_ps1_y double precision, --/U mag --/D PS1 Kron magnitude 
    kronmagerr_ps1_g double precision, --/U mag --/D PS1 Kron magnitude error 
    kronmagerr_ps1_r double precision, --/U mag --/D PS1 Kron magnitude error 
    kronmagerr_ps1_i double precision, --/U mag --/D PS1 Kron magnitude error 
    kronmagerr_ps1_z double precision, --/U mag --/D PS1 Kron magnitude error 
    kronmagerr_ps1_y double precision, --/U mag --/D PS1 Kron magnitude error 
    infoflag2_g integer, --/D PS1 flags, values listed in DetectionFlags2
    infoflag2_r integer, --/D PS1 flags, values listed in DetectionFlags2
    infoflag2_i integer, --/D PS1 flags, values listed in DetectionFlags2
    infoflag2_z integer, --/D PS1 flags, values listed in DetectionFlags2
    infoflag2_y integer, --/D PS1 flags, values listed in DetectionFlags2
    mag_nsc_g double precision, --/U mag --/D Weighted-average magnitude 
    mag_nsc_r double precision, --/U mag --/D Weighted-average magnitude 
    mag_nsc_i double precision, --/U mag --/D Weighted-average magnitude 
    mag_nsc_z double precision, --/U mag --/D Weighted-average magnitude 
    mag_nsc_y double precision, --/U mag --/D Weighted-average magnitude 
    magerr_nsc_g double precision, --/U mag --/D Weighted-average NSC magnitude 
    magerr_nsc_r double precision, --/U mag --/D Weighted-average NSC magnitude 
    magerr_nsc_i double precision, --/U mag --/D Weighted-average NSC magnitude 
    magerr_nsc_z double precision, --/U mag --/D Weighted-average NSC magnitude 
    magerr_nsc_y double precision, --/U mag --/D Weighted-average NSC magnitude 
    psfmag_sdss_u double precision, --/U mag --/D SDSS PSF magnitude 
    psfmag_sdss_g double precision, --/U mag --/D SDSS PSF magnitude 
    psfmag_sdss_r double precision, --/U mag --/D SDSS PSF magnitude 
    psfmag_sdss_i double precision, --/U mag --/D SDSS PSF magnitude 
    psfmag_sdss_z double precision, --/U mag --/D SDSS PSF magnitude 
    psfmagerr_sdss_u double precision, --/U mag --/D SDSS PSF magnitude error 
    psfmagerr_sdss_g double precision, --/U mag --/D SDSS PSF magnitude error 
    psfmagerr_sdss_r double precision, --/U mag --/D SDSS PSF magnitude error 
    psfmagerr_sdss_i double precision, --/U mag --/D SDSS PSF magnitude error 
    psfmagerr_sdss_z double precision, --/U mag --/D SDSS PSF magnitude error 
    modelmag_sdss_u double precision, --/U mag --/D SDSS Model magnitude 
    modelmag_sdss_g double precision, --/U mag --/D SDSS Model magnitude 
    modelmag_sdss_r double precision, --/U mag --/D SDSS Model magnitude 
    modelmag_sdss_i double precision, --/U mag --/D SDSS Model magnitude 
    modelmag_sdss_z double precision, --/U mag --/D SDSS Model magnitude 
    modelmagerr_sdss_u double precision, --/U mag --/D SDSS Model magnitude error 
    modelmagerr_sdss_g double precision, --/U mag --/D SDSS Model magnitude error 
    modelmagerr_sdss_r double precision, --/U mag --/D SDSS Model magnitude error 
    modelmagerr_sdss_i double precision, --/U mag --/D SDSS Model magnitude error 
    modelmagerr_sdss_z double precision, --/U mag --/D SDSS Model magnitude error 
    mag_gaia_g double precision, --/U mag --/D Gaia DR2 G-band magnitude, Vega 
    mag_gaia_bp double precision, --/U mag --/D Gaia DR2 BP-band magnitude, Vega 
    mag_gaia_rp double precision, --/U mag --/D Gaia DR2 RP-band magnitude, Vega 
    magerr_gaia_g double precision, --/U mag --/D Gaia DR2 G-band magnitude error, Vega 
    magerr_gaia_bp double precision, --/U mag --/D Gaia DR2 BP-band magnitude error, Vega 
    magerr_gaia_rp double precision, --/U mag --/D Gaia DR2 RP-band magnitude error, Vega 
    mag_unwise_w1 double precision, --/U mag --/D unWISE (Vega) magnitude, 
    mag_unwise_w2 double precision, --/U mag --/D unWISE (Vega) magnitude, 
    magerr_unwise_w1 double precision, --/U mag --/D unWISE (Vega) magnitude error, 
    magerr_unwise_w2 double precision, --/U mag --/D unWISE (Vega) magnitude error, 
    flags_unwise_w1 integer, --/D unWISE Coadd Flags
    flags_unwise_w2 integer, --/D unWISE Coadd Flags
    mag_ir_y double precision, --/U mag --/D (Vega) magnitude in near-IR, 
    mag_ir_j double precision, --/U mag --/D (Vega) magnitude in near-IR, 
    mag_ir_h double precision, --/U mag --/D (Vega) magnitude in near-IR, 
    mag_ir_k double precision, --/U mag --/D (Vega) magnitude in near-IR, 
    magerr_ir_y double precision, --/U mag --/D magnitude error in near-IR 
    magerr_ir_j double precision, --/U mag --/D magnitude error in near-IR 
    magerr_ir_h double precision, --/U mag --/D magnitude error in near-IR 
    magerr_ir_k double precision, --/U mag --/D magnitude error in near-IR 
    des_var_nepoch_g integer, --/D Number of DES single-epoch photometric datapoints per band
    des_var_nepoch_r integer, --/D Number of DES single-epoch photometric datapoints per band
    des_var_nepoch_i integer, --/D Number of DES single-epoch photometric datapoints per band
    des_var_nepoch_z integer, --/D Number of DES single-epoch photometric datapoints per band
    des_var_nepoch_y integer, --/D Number of DES single-epoch photometric datapoints per band
    des_var_status_g integer, --/D Status of intrinsic variability calculation from DES
    des_var_status_r integer, --/D Status of intrinsic variability calculation from DES
    des_var_status_i integer, --/D Status of intrinsic variability calculation from DES
    des_var_status_z integer, --/D Status of intrinsic variability calculation from DES
    des_var_status_y integer, --/D Status of intrinsic variability calculation from DES
    des_var_rms_g double precision, --/U mag --/D Intrinsic RMS from DES 
    des_var_rms_r double precision, --/U mag --/D Intrinsic RMS from DES 
    des_var_rms_i double precision, --/U mag --/D Intrinsic RMS from DES 
    des_var_rms_z double precision, --/U mag --/D Intrinsic RMS from DES 
    des_var_rms_y double precision, --/U mag --/D Intrinsic RMS from DES 
    des_var_sigrms_g double precision, --/U mag --/D Error of intrinsic RMS from DES 
    des_var_sigrms_r double precision, --/U mag --/D Error of intrinsic RMS from DES 
    des_var_sigrms_i double precision, --/U mag --/D Error of intrinsic RMS from DES 
    des_var_sigrms_z double precision, --/U mag --/D Error of intrinsic RMS from DES 
    des_var_sigrms_y double precision, --/U mag --/D Error of intrinsic RMS from DES 
    des_var_sn_g double precision, --/D The signal-to-noise ratio of the measured intrinsic RMS from DES
    des_var_sn_r double precision, --/D The signal-to-noise ratio of the measured intrinsic RMS from DES
    des_var_sn_i double precision, --/D The signal-to-noise ratio of the measured intrinsic RMS from DES
    des_var_sn_z double precision, --/D The signal-to-noise ratio of the measured intrinsic RMS from DES
    des_var_sn_y double precision, --/D The signal-to-noise ratio of the measured intrinsic RMS from DES
    ps1_var_nepoch_g integer, --/D Number of PS1 single-epoch photometric data points
    ps1_var_nepoch_r integer, --/D Number of PS1 single-epoch photometric data points
    ps1_var_nepoch_i integer, --/D Number of PS1 single-epoch photometric data points
    ps1_var_nepoch_z integer, --/D Number of PS1 single-epoch photometric data points
    ps1_var_nepoch_y integer, --/D Number of PS1 single-epoch photometric data points
    ps1_var_status_g integer, --/D Status of intrinsic variability calculation from PS1
    ps1_var_status_r integer, --/D Status of intrinsic variability calculation from PS1
    ps1_var_status_i integer, --/D Status of intrinsic variability calculation from PS1
    ps1_var_status_z integer, --/D Status of intrinsic variability calculation from PS1
    ps1_var_status_y integer, --/D Status of intrinsic variability calculation from PS1
    ps1_var_rms_g double precision, --/U mag --/D Intrinsic RMS from PS1 
    ps1_var_rms_r double precision, --/U mag --/D Intrinsic RMS from PS1 
    ps1_var_rms_i double precision, --/U mag --/D Intrinsic RMS from PS1 
    ps1_var_rms_z double precision, --/U mag --/D Intrinsic RMS from PS1 
    ps1_var_rms_y double precision, --/U mag --/D Intrinsic RMS from PS1 
    ps1_var_sigrms_g double precision, --/U mag --/D Error of intrinsic RMS from PS1 
    ps1_var_sigrms_r double precision, --/U mag --/D Error of intrinsic RMS from PS1 
    ps1_var_sigrms_i double precision, --/U mag --/D Error of intrinsic RMS from PS1 
    ps1_var_sigrms_z double precision, --/U mag --/D Error of intrinsic RMS from PS1 
    ps1_var_sigrms_y double precision, --/U mag --/D Error of intrinsic RMS from PS1 
    ps1_var_sn_g double precision, --/D The signal-to-noise ratio of the measured intrinsic RMS from PS1
    ps1_var_sn_r double precision, --/D The signal-to-noise ratio of the measured intrinsic RMS from PS1
    ps1_var_sn_i double precision, --/D The signal-to-noise ratio of the measured intrinsic RMS from PS1
    ps1_var_sn_z double precision, --/D The signal-to-noise ratio of the measured intrinsic RMS from PS1
    ps1_var_sn_y double precision --/D The signal-to-noise ratio of the measured intrinsic RMS from PS1
);


--
-- Name: dr18_cadence; Type: TABLE; Schema: minidb; Owner: -
--

CREATE TABLE minidb.dr18_cadence (
----------------------------------------------------------------------
--/H Cadences define the time between series of exposures (one "epoch") on a field, and the observing conditions, e.g., skybrightness, for each epoch.
----------------------------------------------------------------------
    label text, --/D Descriptive name for the cadence with a version 
    nepochs integer, --/D Number of epochs in the cadence 
    pk bigint NOT NULL, --/D Primary key 
    label_root text, --/D Descriptive name, typically {bright/dark}_{nepochs}x{nexps}
    label_version text, --/D Version; cadences are added in versioned batches 
    max_skybrightness real, --/D The maximum skybrightness for all epochs in this cadence 
    nexp_total integer --/D The total number of exposures planned for this cadence 
);


--
-- Name: dr18_cadence_epoch; Type: TABLE; Schema: minidb; Owner: -
--

CREATE TABLE minidb.dr18_cadence_epoch (
----------------------------------------------------------------------
--/H Constraints for a single epoch within a cadence.
----------------------------------------------------------------------
    label text NOT NULL, --/D Descriptive name for the cadence with a version 
    nepochs integer, --/D Number of epochs in the cadence 
    cadence_pk bigint, --/D Primary key of the cadence this epoch belongs to 
    epoch integer NOT NULL, --/D Which epoch is this in the cadence (0-indexed) 
    delta double precision, --/U days --/D Nominal (goal) time since previous epoch 
    skybrightness real, --/D Maximum allowed skybrightness, i.e. moon illumination (0.0 to 1.0) 
    delta_max real, --/U days --/D Maximum allowed time since previous epoch 
    delta_min real, --/U days --/D Minimum allowed time since previous epoch 
    nexp integer, --/D Number of exposures in this epoch 
    max_length real, --/D Maximum allowed length of epoch, i.e. time between first and last exposure 
    obsmode_pk text --/D Reference to the observing parameters (airmass, moon seperation, etc.) 
);


--
-- Name: dr18_carton; Type: TABLE; Schema: minidb; Owner: -
--

CREATE TABLE minidb.dr18_carton (
----------------------------------------------------------------------
--/H The table contains the list of cartons along with the target selection plan that generated them.
----------------------------------------------------------------------
    carton text, --/D The name of the carton.
    carton_pk integer NOT NULL, --/D The primary key. A sequential identifier.
    mapper_pk smallint, --/D The primary key of the mapper leading this carton. See dr18_mapper.
    category_pk smallint, --/D The primary key of the category in the dr18_category table.
    target_selection_plan text --/D The target selection plan version for which this carton was run.
);


--
-- Name: dr18_carton_to_target; Type: TABLE; Schema: minidb; Owner: -
--

CREATE TABLE minidb.dr18_carton_to_target (
----------------------------------------------------------------------
--/H The table stores the targets assigned to a given carton along with information about the instrument that will observe that target, and offseting data.
----------------------------------------------------------------------
    carton_to_target_pk integer NOT NULL, --/D The primary key. A sequential identifier.
    lambda_eff real, --/U angstrom --/D The effective wavelength at which the object will be observed 
    carton_pk smallint, --/D The primary key of the carton in the dr18_carton table.
    target_pk bigint, --/D The primary key of the target in the dr18_target table.
    cadence_pk smallint, --/D The primary key of the cadence in the dr18_cadence table.
    priority integer, --/D The target priority. Used for scheduling.
    value real, --/D An internal metric of the target value used for scheduling.
    instrument_pk integer, --/D The primary key of the instrument in the dr18_instrument table.
    delta_ra double precision, --/D The RA offset for fibre positioning, in arcsec.
    delta_dec double precision, --/D The Dec offset for fibre positioning, in arcsec.
    inertial boolean --/D Whether this is an inertial target (no proper motion will be applied).
);


--
-- Name: dr18_carton_txt; Type: TABLE; Schema: minidb; Owner: -
--

CREATE TABLE minidb.dr18_carton_txt (
----------------------------------------------------------------------
--/H This table defines a versioned set of cartons that were considered at a specific point in the SDSS-V survey. It contains instructions to robostrategy about how to handle targets from each of those cartons when robostrategy is planning the survey and assigning fibers to targets.
----------------------------------------------------------------------
    carton text, --/D The unique carton name
    plan text, --/D A version code which identifies the specific run of the SDSS-V target_selection package that used to select targets associated with this particular iteration of this carton
    category text, --/D The broad target category which this carton falls within - used by robostrategy when planning the survey and assigning fibers to targets
    stage text, --/D This informs robostrategy which step of fiber assignment this carton should be considered within
    active boolean --/D A boolean flag - robostrategy only considers cartons marked with active=True
);


--
-- Name: dr18_cataclysmic_variables; Type: TABLE; Schema: minidb; Owner: -
--

CREATE TABLE minidb.dr18_cataclysmic_variables (
----------------------------------------------------------------------
--/H AAVSO cataclysmic variables from cataclysmic (explosive and novalike) variables (N, NA, NB, NC, NL, NR,
--/T            SN, SNI, SNII, UG, UGSS, UGSU, UGZ, ZAND), VSX in summer 2019, has
--/T been x-matched with Gaia DR2, and had some manual pruning
----------------------------------------------------------------------
    ref_id bigint NOT NULL,
    solution_id bigint,
    designation text,
    source_id bigint,
    random_index integer,
    ref_epoch real,
    ra double precision,
    ra_error double precision,
    "dec" double precision,
    dec_error double precision,
    parallax double precision,
    parallax_error double precision,
    parallax_over_error double precision,
    pmra double precision,
    pmra_error double precision,
    pmdec double precision,
    pmdec_error double precision,
    ra_dec_corr double precision,
    ra_parallax_corr double precision,
    ra_pmra_corr double precision,
    ra_pmdec_corr double precision,
    dec_parallax_corr double precision,
    dec_pmra_corr double precision,
    dec_pmdec_corr double precision,
    parallax_pmra_corr double precision,
    parallax_pmdec_corr double precision,
    pmra_pmdec_corr double precision,
    astrometric_n_obs_al smallint,
    astrometric_n_obs_ac smallint,
    astrometric_n_good_obs_al smallint,
    astrometric_n_bad_obs_al smallint,
    astrometric_gof_al double precision,
    astrometric_chi2_al double precision,
    astrometric_excess_noise double precision,
    astrometric_excess_noise_sig double precision,
    astrometric_params_solved smallint,
    astrometric_primary_flag boolean,
    astrometric_weight_al double precision,
    astrometric_pseudo_colour double precision,
    astrometric_pseudo_colour_error double precision,
    mean_varpi_factor_al double precision,
    astrometric_matched_observations smallint,
    visibility_periods_used smallint,
    astrometric_sigma5d_max double precision,
    frame_rotator_object_type smallint,
    matched_observations smallint,
    duplicated_source boolean,
    phot_g_n_obs smallint,
    phot_g_mean_flux double precision,
    phot_g_mean_flux_error double precision,
    phot_g_mean_flux_over_error double precision,
    phot_g_mean_mag double precision,
    phot_bp_n_obs smallint,
    phot_bp_mean_flux double precision,
    phot_bp_mean_flux_error double precision,
    phot_bp_mean_flux_over_error double precision,
    phot_bp_mean_mag double precision,
    phot_rp_n_obs smallint,
    phot_rp_mean_flux double precision,
    phot_rp_mean_flux_error double precision,
    phot_rp_mean_flux_over_error double precision,
    phot_rp_mean_mag double precision,
    phot_bp_rp_excess_factor double precision,
    phot_proc_mode smallint,
    bp_rp double precision,
    bp_g double precision,
    g_rp double precision,
    radial_velocity double precision,
    radial_velocity_error double precision,
    rv_nb_transits smallint,
    rv_template_teff real,
    rv_template_logg real,
    rv_template_fe_h real,
    phot_variable_flag text,
    l double precision,
    b double precision,
    ecl_lon double precision,
    ecl_lat double precision,
    priam_flags integer,
    teff_val double precision,
    teff_percentile_lower double precision,
    teff_percentile_upper double precision,
    a_g_val real,
    a_g_percentile_lower real,
    a_g_percentile_upper real,
    e_bp_min_rp_val real,
    e_bp_min_rp_percentile_lower real,
    e_bp_min_rp_percentile_upper real,
    flame_flags integer,
    radius_val double precision,
    radius_percentile_lower double precision,
    radius_percentile_upper double precision,
    lum_val double precision,
    lum_percentile_lower double precision,
    lum_percentile_upper double precision
);


--
-- Name: dr18_catalog; Type: TABLE; Schema: minidb; Owner: -
--

CREATE TABLE minidb.dr18_catalog (
----------------------------------------------------------------------
--/H The table stores the results of the cross-match used for DR18 targeting. All entries in this table are expected to be unique physical objects drawn from one or more parent catalogues. The dr18_catalog_to_ tables provide the relationship between dr18_catalog objects and their parent catalogue counterparts.
----------------------------------------------------------------------
    catalogid bigint NOT NULL, --/D The SDSS identifier for a unique object in this cross-match run.
    iauname text, --/D The IAU-style name. Not used.
    ra double precision, --/U degrees --/D The right ascension of the target in ICRS coordinates for J2015.5. Taken from the lead parent catalogue 
    "dec" double precision, --/U degrees --/D The declination of the target in ICRS coordinates for J2015.5. Taken from the lead parent catalogue 
    pmra real, --/U mas/yr --/D The proper motion of the target in right ascension. Taken from the lead parent catalogue. This is a true angle (i.e., the cos(dec) factor has been applied) 
    pmdec real, --/U mas/yr --/D The proper motion of the target in declination. Taken from the lead parent catalogue 
    parallax real, --/U arcsec --/D The parallax of the target. Taken from the lead parent catalogue 
    lead text, --/D The name of the parent catalogue from which this target was selected and whose data was used to determine its astrometric position.
    version_id integer --/D The internal version for the cross-match.
);


--
-- Name: dr18_catalog_to_allwise; Type: TABLE; Schema: minidb; Owner: -
--

CREATE TABLE minidb.dr18_catalog_to_allwise (
----------------------------------------------------------------------
--/H The table contains the cross-match between the dr18_catalog targets and the dr18_allwise table.
----------------------------------------------------------------------
    catalogid bigint, --/D The catalogid identifier in the dr18_catalog table.
    target_id bigint, --/D The primary key identifier in the dr18_allwise table.
    version_id smallint, --/D The internal version for the cross-match.
    distance double precision, --/D The distance between the catalog and target coordinates if best=F.
    best boolean --/D Whether this is considered the best match between the catalog entry and dr18_allwise.
);


--
-- Name: dr18_catalog_to_bhm_efeds_veto; Type: TABLE; Schema: minidb; Owner: -
--

CREATE TABLE minidb.dr18_catalog_to_bhm_efeds_veto (
----------------------------------------------------------------------
--/H The table contains the cross-match between the dr18_catalog targets and the dr18_bhm_efeds_veto table.
----------------------------------------------------------------------
    catalogid bigint, --/D The catalogid identifier in the dr18_catalog table.
    target_id bigint, --/D The primary key identifier in the dr18_bhm_efeds_veto table.
    version_id smallint, --/D The internal version for the cross-match.
    distance double precision, --/D The distance between the catalog and target coordinates if best=F.
    best boolean --/D Whether this is considered the best match between the catalog entry and dr18_bhm_efeds_veto.
);


--
-- Name: dr18_catalog_to_bhm_rm_v0_2; Type: TABLE; Schema: minidb; Owner: -
--

CREATE TABLE minidb.dr18_catalog_to_bhm_rm_v0_2 (
----------------------------------------------------------------------
--/H The table contains the cross-match between the dr18_catalog targets and the dr18_rm_v0_2 table.
----------------------------------------------------------------------
    catalogid bigint, --/D The catalogid identifier in the dr18_catalog table.
    target_id bigint, --/D The primary key identifier in the dr18_rm_v0_2 table.
    version_id smallint, --/D The internal version for the cross-match.
    distance double precision, --/D The distance between the catalog and target coordinates if best=F.
    best boolean --/D Whether this is considered the best match between the catalog entry and dr18_rm_v0_2.
);


--
-- Name: dr18_catalog_to_catwise2020; Type: TABLE; Schema: minidb; Owner: -
--

CREATE TABLE minidb.dr18_catalog_to_catwise2020 (
----------------------------------------------------------------------
--/H The table contains the cross-match between the dr18_catalog targets and the dr18_catwise2020 table.
----------------------------------------------------------------------
    catalogid bigint, --/D The catalogid identifier in the dr18_catalog table.
    target_id character varying(25), --/D The primary key identifier in the dr18_catwise2020 table.
    version_id smallint, --/D The internal version for the cross-match.
    distance double precision, --/D The distance between the catalog and target coordinates if best=F.
    best boolean --/D Whether this is considered the best match between the catalog entry and dr18_catwise2020.
);


--
-- Name: dr18_catalog_to_glimpse; Type: TABLE; Schema: minidb; Owner: -
--

CREATE TABLE minidb.dr18_catalog_to_glimpse (
----------------------------------------------------------------------
--/H The table contains the cross-match between the dr18_catalog targets and the dr18_glimpse table.
----------------------------------------------------------------------
    catalogid bigint, --/D The catalogid identifier in the dr18_catalog table.
    target_id bigint, --/D The primary key identifier in the dr18_glimpse table.
    version_id smallint, --/D The internal version for the cross-match.
    distance double precision, --/D The distance between the catalog and target coordinates if best=F.
    best boolean --/D Whether this is considered the best match between the catalog entry and dr18_glimpse.
);


--
-- Name: dr18_catalog_to_guvcat; Type: TABLE; Schema: minidb; Owner: -
--

CREATE TABLE minidb.dr18_catalog_to_guvcat (
----------------------------------------------------------------------
--/H The table contains the cross-match between the dr18_catalog targets and the dr18_guvcat table.
----------------------------------------------------------------------
    catalogid bigint, --/D The catalogid identifier in the dr18_catalog table.
    target_id bigint, --/D The primary key identifier in the dr18_guvcat table.
    version_id smallint, --/D The internal version for the cross-match.
    distance double precision, --/D The distance between the catalog and target coordinates if best=F.
    best boolean --/D Whether this is considered the best match between the catalog entry and dr18_guvcat.
);


--
-- Name: dr18_catalog_to_legacy_survey_dr8; Type: TABLE; Schema: minidb; Owner: -
--

CREATE TABLE minidb.dr18_catalog_to_legacy_survey_dr8 (
----------------------------------------------------------------------
--/H The table contains the cross-match between the dr18_catalog targets and the dr18_legacy_survey_dr8 table.
----------------------------------------------------------------------
    catalogid bigint, --/D The catalogid identifier in the dr18_catalog table.
    target_id bigint, --/D The primary key identifier in the dr18_legacy_survey_dr8 table.
    version_id smallint, --/D The internal version for the cross-match.
    distance double precision, --/D The distance between the catalog and target coordinates if best=F.
    best boolean --/D Whether this is considered the best match between the catalog entry and dr18_legacy_survey_dr8.
);


--
-- Name: dr18_catalog_to_panstarrs1; Type: TABLE; Schema: minidb; Owner: -
--

CREATE TABLE minidb.dr18_catalog_to_panstarrs1 (
----------------------------------------------------------------------
--/H The table contains the cross-match between the dr18_catalog targets and the dr18_panstarrs1 table.
----------------------------------------------------------------------
    catalogid bigint, --/D The catalogid identifier in the dr18_catalog table.
    target_id bigint, --/D The primary key identifier in the dr18_panstarrs1 table.
    version_id smallint, --/D The internal version for the cross-match.
    distance double precision, --/D The distance between the catalog and target coordinates if best=F.
    best boolean --/D Whether this is considered the best match between the catalog entry and dr18_panstarrs1.
);


--
-- Name: dr18_catalog_to_sdss_dr13_photoobj_primary; Type: TABLE; Schema: minidb; Owner: -
--

CREATE TABLE minidb.dr18_catalog_to_sdss_dr13_photoobj_primary (
----------------------------------------------------------------------
--/H The table contains the cross-match between the dr18_catalog targets and the dr18_sdss_dr13_photoobj_primary table.
----------------------------------------------------------------------
    catalogid bigint, --/D The catalogid identifier in the dr18_catalog table.
    target_id bigint, --/D The primary key identifier in the dr18_sdss_dr13_photoobj_primary table.
    version_id smallint, --/D The internal version for the cross-match.
    distance double precision, --/D The distance between the catalog and target coordinates if best=F.
    best boolean --/D Whether this is considered the best match between the catalog entry and dr18_sdss_dr13_photoobj_primary.
);


--
-- Name: dr18_catalog_to_sdss_dr16_specobj; Type: TABLE; Schema: minidb; Owner: -
--

CREATE TABLE minidb.dr18_catalog_to_sdss_dr16_specobj (
----------------------------------------------------------------------
--/H The table contains the cross-match between the dr18_catalog targets and the dr18_sdss_dr16_specobj table.
----------------------------------------------------------------------
    catalogid bigint, --/D The catalogid identifier in the dr18_catalog table.
    target_id numeric(20,0), --/D The primary key identifier in the dr18_sdss_dr16_specobj table.
    version_id smallint, --/D The internal version for the cross-match.
    distance double precision, --/D The distance between the catalog and target coordinates if best=F.
    best boolean --/D Whether this is considered the best match between the catalog entry and dr18_sdss_dr16_specobj.
);


--
-- Name: dr18_catalog_to_skies_v2; Type: TABLE; Schema: minidb; Owner: -
--

CREATE TABLE minidb.dr18_catalog_to_skies_v2 (
----------------------------------------------------------------------
--/H The table contains the cross-match between the dr18_catalog targets and the dr18_skies_v2 table.
----------------------------------------------------------------------
    catalogid bigint, --/D The catalogid identifier in the dr18_catalog table.
    target_id bigint, --/D The primary key identifier in the dr18_skies_v2 table.
    version_id smallint, --/D The internal version for the cross-match.
    distance double precision, --/D The distance between the catalog and target coordinates if best=F.
    best boolean --/D Whether this is considered the best match between the catalog entry and dr18_skies_v2.
);


--
-- Name: dr18_catalog_to_skymapper_dr2; Type: TABLE; Schema: minidb; Owner: -
--

CREATE TABLE minidb.dr18_catalog_to_skymapper_dr2 (
----------------------------------------------------------------------
--/H The table contains the cross-match between the dr18_catalog targets and the dr18_skymapper_dr2 table.
----------------------------------------------------------------------
    catalogid bigint, --/D The catalogid identifier in the dr18_catalog table.
    target_id bigint, --/D The primary key identifier in the dr18_skymapper_dr2 table.
    version_id smallint, --/D The internal version for the cross-match.
    distance double precision, --/D The distance between the catalog and target coordinates if best=F.
    best boolean --/D Whether this is considered the best match between the catalog entry and dr18_skymapper_dr2.
);


--
-- Name: dr18_catalog_to_supercosmos; Type: TABLE; Schema: minidb; Owner: -
--

CREATE TABLE minidb.dr18_catalog_to_supercosmos (
----------------------------------------------------------------------
--/H The table contains the cross-match between the dr18_catalog targets and the dr18_supercosmos table.
----------------------------------------------------------------------
    catalogid bigint, --/D The catalogid identifier in the dr18_catalog table.
    target_id bigint, --/D The primary key identifier in the dr18_supercosmos table.
    version_id smallint, --/D The internal version for the cross-match.
    distance double precision, --/D The distance between the catalog and target coordinates if best=F.
    best boolean --/D Whether this is considered the best match between the catalog entry and dr18_supercosmos.
);


--
-- Name: dr18_catalog_to_tic_v8; Type: TABLE; Schema: minidb; Owner: -
--

CREATE TABLE minidb.dr18_catalog_to_tic_v8 (
----------------------------------------------------------------------
--/H The table contains the cross-match between the dr18_catalog targets and the dr18_tic_v8 table.
----------------------------------------------------------------------
    catalogid bigint, --/D The catalogid identifier in the dr18_catalog table.
    target_id bigint, --/D The primary key identifier in the dr18_tic_v8 table.
    version_id smallint, --/D The internal version for the cross-match.
    distance double precision, --/D The distance between the catalog and target coordinates if best=F.
    best boolean --/D Whether this is considered the best match between the catalog entry and dr18_tic_v8.
);


--
-- Name: dr18_catalog_to_tycho2; Type: TABLE; Schema: minidb; Owner: -
--

CREATE TABLE minidb.dr18_catalog_to_tycho2 (
----------------------------------------------------------------------
--/H The table contains the cross-match between the dr18_catalog targets and the dr18_tycho2 table.
----------------------------------------------------------------------
    catalogid bigint, --/D The catalogid identifier in the dr18_catalog table.
    target_id text, --/D The primary key identifier in the dr18_tycho2 table.
    version_id smallint, --/D The internal version for the cross-match.
    distance double precision, --/D The distance between the catalog and target coordinates if best=F.
    best boolean --/D Whether this is considered the best match between the catalog entry and dr18_tycho2.
);


--
-- Name: dr18_catalog_to_uvotssc1; Type: TABLE; Schema: minidb; Owner: -
--

CREATE TABLE minidb.dr18_catalog_to_uvotssc1 (
----------------------------------------------------------------------
--/H The table contains the cross-match between the dr18_catalog targets and the dr18_uvotssc1 table.
----------------------------------------------------------------------
    catalogid bigint, --/D The catalogid identifier in the dr18_catalog table.
    target_id bigint, --/D The primary key identifier in the dr18_uvotssc1 table.
    version_id smallint, --/D The internal version for the cross-match.
    distance double precision, --/D The distance between the catalog and target coordinates if best=F.
    best boolean --/D Whether this is considered the best match between the catalog entry and dr18_uvotssc1.
);


--
-- Name: dr18_catalog_to_xmm_om_suss_4_1; Type: TABLE; Schema: minidb; Owner: -
--

CREATE TABLE minidb.dr18_catalog_to_xmm_om_suss_4_1 (
----------------------------------------------------------------------
--/H The table contains the cross-match between the dr18_catalog targets and the dr18_xmm_om_suss_4_1 table.
----------------------------------------------------------------------
    catalogid bigint, --/D The catalogid identifier in the dr18_catalog table.
    target_id bigint, --/D The primary key identifier in the dr18_xmm_om_suss_4_1 table.
    version_id smallint, --/D The internal version for the cross-match.
    distance double precision, --/D The distance between the catalog and target coordinates if best=F.
    best boolean --/D Whether this is considered the best match between the catalog entry and dr18_xmm_om_suss_4_1.
);


--
-- Name: dr18_catalogdb_version; Type: TABLE; Schema: minidb; Owner: -
--

CREATE TABLE minidb.dr18_catalogdb_version (
    id integer NOT NULL,
    plan text,
    tag text
);


--
-- Name: dr18_category; Type: TABLE; Schema: minidb; Owner: -
--

CREATE TABLE minidb.dr18_category (
----------------------------------------------------------------------
--/H This table indicates the category of a carton (science, standards, etc.)
----------------------------------------------------------------------
    pk integer NOT NULL, --/D The primary key. A sequential identifier.
    label text --/D The name of the category.
);


--
-- Name: dr18_catwise2020; Type: TABLE; Schema: minidb; Owner: -
--

CREATE TABLE minidb.dr18_catwise2020 (
    source_name character(21),
    source_id character(25) NOT NULL,
    ra double precision,
    "dec" double precision,
    sigra real,
    sigdec real,
    sigradec real,
    wx real,
    wy real,
    w1sky real,
    w1sigsk real,
    w1conf real,
    w2sky real,
    w2sigsk real,
    w2conf real,
    w1fitr real,
    w2fitr real,
    w1snr real,
    w2snr real,
    w1flux real,
    w1sigflux real,
    w2flux real,
    w2sigflux real,
    w1mpro real,
    w1sigmpro real,
    w1rchi2 real,
    w2mpro real,
    w2sigmpro real,
    w2rchi2 real,
    rchi2 real,
    nb integer,
    na integer,
    w1sat real,
    w2sat real,
    w1mag real,
    w1sigm real,
    w1flg integer,
    w1cov real,
    w2mag real,
    w2sigm real,
    w2flg integer,
    w2cov real,
    w1mag_1 real,
    w1sigm_1 real,
    w1flg_1 integer,
    w2mag_1 real,
    w2sigm_1 real,
    w2flg_1 integer,
    w1mag_2 real,
    w1sigm_2 real,
    w1flg_2 integer,
    w2mag_2 real,
    w2sigm_2 real,
    w2flg_2 integer,
    w1mag_3 real,
    w1sigm_3 real,
    w1flg_3 integer,
    w2mag_3 real,
    w2sigm_3 real,
    w2flg_3 integer,
    w1mag_4 real,
    w1sigm_4 real,
    w1flg_4 integer,
    w2mag_4 real,
    w2sigm_4 real,
    w2flg_4 integer,
    w1mag_5 real,
    w1sigm_5 real,
    w1flg_5 integer,
    w2mag_5 real,
    w2sigm_5 real,
    w2flg_5 integer,
    w1mag_6 real,
    w1sigm_6 real,
    w1flg_6 integer,
    w2mag_6 real,
    w2sigm_6 real,
    w2flg_6 integer,
    w1mag_7 real,
    w1sigm_7 real,
    w1flg_7 integer,
    w2mag_7 real,
    w2sigm_7 real,
    w2flg_7 integer,
    w1mag_8 real,
    w1sigm_8 real,
    w1flg_8 integer,
    w2mag_8 real,
    w2sigm_8 real,
    w2flg_8 integer,
    w1nm integer,
    w1m integer,
    w1magp real,
    w1sigp1 real,
    w1sigp2 real,
    w1k real,
    w1ndf integer,
    w1mlq real,
    w1mjdmin double precision,
    w1mjdmax double precision,
    w1mjdmean double precision,
    w2nm integer,
    w2m integer,
    w2magp real,
    w2sigp1 real,
    w2sigp2 real,
    w2k real,
    w2ndf integer,
    w2mlq real,
    w2mjdmin double precision,
    w2mjdmax double precision,
    w2mjdmean double precision,
    rho12 integer,
    q12 integer,
    niters integer,
    nsteps integer,
    mdetid integer,
    p1 real,
    p2 real,
    meanobsmjd double precision,
    ra_pm double precision,
    dec_pm double precision,
    sigra_pm real,
    sigdec_pm real,
    sigradec_pm real,
    pmra real,
    pmdec real,
    sigpmra real,
    sigpmdec real,
    w1snr_pm real,
    w2snr_pm real,
    w1flux_pm real,
    w1sigflux_pm real,
    w2flux_pm real,
    w2sigflux_pm real,
    w1mpro_pm real,
    w1sigmpro_pm real,
    w1rchi2_pm real,
    w2mpro_pm real,
    w2sigmpro_pm real,
    w2rchi2_pm real,
    rchi2_pm real,
    pmcode character(7),
    niters_pm integer,
    nsteps_pm integer,
    dist real,
    dw1mag real,
    rch2w1 real,
    dw2mag real,
    rch2w2 real,
    elon_avg double precision,
    elonsig real,
    elat_avg double precision,
    elatsig real,
    delon real,
    delonsig real,
    delat real,
    delatsig real,
    delonsnr real,
    delatsnr real,
    chi2pmra real,
    chi2pmdec real,
    ka integer,
    k1 integer,
    k2 integer,
    km integer,
    par_pm real,
    par_pmsig real,
    par_stat real,
    par_sigma real,
    dist_x real,
    cc_flags character(16),
    w1cc_map integer,
    w1cc_map_str character(20),
    w2cc_map integer,
    w2cc_map_str character(20),
    n_aw integer,
    ab_flags character(9),
    w1ab_map integer,
    w1ab_map_str character(13),
    w2ab_map integer,
    w2ab_map_str character(13),
    glon double precision,
    glat double precision,
    elon double precision,
    elat double precision,
    unwise_objid character(20)
);


--
-- Name: dr18_ebosstarget_v5; Type: TABLE; Schema: minidb; Owner: -
--

CREATE TABLE minidb.dr18_ebosstarget_v5 (
----------------------------------------------------------------------
--/H A catalog of targets, selected from SDSS+WISE imaging that were considered for observation in the
--/T  SDSS-IV/eBOSS project, including spectrophotometric starts and candidate QSOs. <br>
--/T  This catalogue is a data product of the ebosstarget target selection software,
--/T version "v5_0".
----------------------------------------------------------------------
    run integer, --/D SDSS imaging run 
    camcol integer, --/D SDSS imaging camcol 
    field integer, --/D SDSS imaging field 
    id integer, --/D SDSS imaging object id 
    rerun text, --/D SDSS imaging rerun 
    fibermag_u real, --/U mag --/D Magnitude in 3 arcsec diameter fiber radius, u-band 
    fibermag_g real, --/U mag --/D Magnitude in 3 arcsec diameter fiber radius, g-band 
    fibermag_r real, --/U mag --/D Magnitude in 3 arcsec diameter fiber radius, r-band 
    fibermag_i real, --/U mag --/D Magnitude in 3 arcsec diameter fiber radius, i-band 
    fibermag_z real, --/U mag --/D Magnitude in 3 arcsec diameter fiber radius, z-band 
    fiber2mag_u real, --/U mag --/D Magnitude in 2 arcsec diameter fiber radius, u-band 
    fiber2mag_g real, --/U mag --/D Magnitude in 2 arcsec diameter fiber radius, g-band 
    fiber2mag_r real, --/U mag --/D Magnitude in 2 arcsec diameter fiber radius, r-band 
    fiber2mag_i real, --/U mag --/D Magnitude in 2 arcsec diameter fiber radius, i-band 
    fiber2mag_z real, --/U mag --/D Magnitude in 2 arcsec diameter fiber radius, z-band 
    calib_status_u integer, --/D Calibration status in u-band 
    calib_status_g integer, --/D Calibration status in g-band 
    calib_status_r integer, --/D Calibration status in r-band 
    calib_status_i integer, --/D Calibration status in i-band 
    calib_status_z integer, --/D Calibration status in z-band 
    ra double precision, --/U deg --/D J2000 Right Ascension 
    "dec" double precision, --/U deg --/D J2000 Declination 
    epoch real, --/U year --/D Epoch of position 
    pmra real, --/U mas/yr --/D proper motion in RA direction 
    pmdec real, --/U mas/yr --/D - proper motion in Dec direction 
    eboss_target1 bigint, --/D eBOSS target selection information, for eBOSS plates 
    eboss_target2 bigint, --/D eBOSS target selection information, for TDSS, SPIDERS, ELG, etc. plates 
    eboss_target_id bigint, --/D eBOSS unique target identifier for every spectroscopic target 
    thing_id_targeting integer, --/D thing_id value from the version of resolve from which the targeting was created 
    objc_type integer, --/D Type classification of the object (star, galaxy, cosmic ray, etc.) 
    objc_flags integer, --/D Photo Object Attribute Flags(?) 
    objc_flags2 integer, --/D Additional Photo Object Attribute Flags(?) 
    flags integer, --/D Target selection flags set by ebosstarget (?) 
    flags2 integer, --/D Additional target selection flags set by ebosstarget (?) 
    psf_fwhm_u real, --/U arcsec --/D Imaging FWHM in u-band 
    psf_fwhm_g real, --/U arcsec --/D Imaging FWHM in g-band 
    psf_fwhm_r real, --/U arcsec --/D Imaging FWHM in r-band 
    psf_fwhm_i real, --/U arcsec --/D Imaging FWHM in i-band 
    psf_fwhm_z real, --/U arcsec --/D Imaging FWHM in z-band 
    psfflux_u real, --/U nMgy --/D PSF flux, u-band 
    psfflux_g real, --/U nMgy --/D PSF flux, g-band 
    psfflux_r real, --/U nMgy --/D PSF flux, r-band 
    psfflux_i real, --/U nMgy --/D PSF flux, i-band 
    psfflux_z real, --/U nMgy --/D PSF flux, z-band 
    psfflux_ivar_u real, --/U nMgy^{-2} --/D PSF flux inverse variance, u-band 
    psfflux_ivar_g real, --/U nMgy^{-2} --/D PSF flux inverse variance, g-band 
    psfflux_ivar_r real, --/U nMgy^{-2} --/D PSF flux inverse variance, r-band 
    psfflux_ivar_i real, --/U nMgy^{-2} --/D PSF flux inverse variance, r-band 
    psfflux_ivar_z real, --/U nMgy^{-2} --/D PSF flux inverse variance, i-band 
    extinction_u real, --/U mag --/D Extinction in u-band 
    extinction_g real, --/U mag --/D Extinction in g-band 
    extinction_r real, --/U mag --/D Extinction in r-band 
    extinction_i real, --/U mag --/D Extinction in i-band 
    extinction_z real, --/U mag --/D Extinction in z-band 
    fiberflux_u real, --/U nMgy --/D Flux in 3 arcsec diameter fiber radius, u-band 
    fiberflux_g real, --/U nMgy --/D Flux in 3 arcsec diameter fiber radius, g-band 
    fiberflux_r real, --/U nMgy --/D Flux in 3 arcsec diameter fiber radius, r-band 
    fiberflux_i real, --/U nMgy --/D Flux in 3 arcsec diameter fiber radius, i-band 
    fiberflux_z real, --/U nMgy --/D Flux in 3 arcsec diameter fiber radius, z-band 
    fiberflux_ivar_u real, --/U nMgy^{-2} --/D Inverse variance of flux in 3 arcsec diameter fiber radius, u-band 
    fiberflux_ivar_g real, --/U nMgy^{-2} --/D Inverse variance of flux in 3 arcsec diameter fiber radius, g-band 
    fiberflux_ivar_r real, --/U nMgy^{-2} --/D Inverse variance of flux in 3 arcsec diameter fiber radius, r-band 
    fiberflux_ivar_i real, --/U nMgy^{-2} --/D Inverse variance of flux in 3 arcsec diameter fiber radius, i-band 
    fiberflux_ivar_z real, --/U nMgy^{-2} --/D Inverse variance of flux in 3 arcsec diameter fiber radius, z-band 
    fiber2flux_ivar_u real, --/U nMgy^{-2} --/D Inverse variance of flux in 2 arcsec diameter fiber radius, u-band 
    fiber2flux_ivar_g real, --/U nMgy^{-2} --/D Inverse variance of flux in 2 arcsec diameter fiber radius, g-band 
    fiber2flux_ivar_r real, --/U nMgy^{-2} --/D Inverse variance of flux in 2 arcsec diameter fiber radius, r-band 
    fiber2flux_ivar_i real, --/U nMgy^{-2} --/D Inverse variance of flux in 2 arcsec diameter fiber radius, i-band 
    fiber2flux_ivar_z real, --/U nMgy^{-2} --/D Inverse variance of flux in 2 arcsec diameter fiber radius, z-band 
    modelflux_u real, --/U nMgy --/D Flux of best fitting model, u-band 
    modelflux_g real, --/U nMgy --/D Flux of best fitting model, g-band 
    modelflux_r real, --/U nMgy --/D Flux of best fitting model, r-band 
    modelflux_i real, --/U nMgy --/D Flux of best fitting model, i-band 
    modelflux_z real, --/U nMgy --/D Flux of best fitting model, z-band 
    modelflux_ivar_u real, --/U nMgy^{-2} --/D Inverse variance of flux of best fitting model, u-band 
    modelflux_ivar_g real, --/U nMgy^{-2} --/D Inverse variance of flux of best fitting model, g-band 
    modelflux_ivar_r real, --/U nMgy^{-2} --/D Inverse variance of flux of best fitting model, r-band 
    modelflux_ivar_i real, --/U nMgy^{-2} --/D Inverse variance of flux of best fitting model, i-band 
    modelflux_ivar_z real, --/U nMgy^{-2} --/D Inverse variance of flux of best fitting model, z-band 
    modelmag_u real, --/U nMgy --/D Magnitude of best fitting model, u-band 
    modelmag_g real, --/U nMgy --/D Magnitude of best fitting model, g-band 
    modelmag_r real, --/U nMgy --/D Magnitude of best fitting model, r-band 
    modelmag_i real, --/U nMgy --/D Magnitude of best fitting model, i-band 
    modelmag_z real, --/U nMgy --/D Magnitude of best fitting model, z-band 
    modelmag_ivar_u real, --/U nMgy^{-2} --/D Inverse variance of magnitude of best fitting model, u-band 
    modelmag_ivar_g real, --/U nMgy^{-2} --/D Inverse variance of magnitude of best fitting model, g-band 
    modelmag_ivar_r real, --/U nMgy^{-2} --/D Inverse variance of magnitude of best fitting model, r-band 
    modelmag_ivar_i real, --/U nMgy^{-2} --/D Inverse variance of magnitude of best fitting model, i-band 
    modelmag_ivar_z real, --/U nMgy^{-2} --/D Inverse variance of magnitude of best fitting model, z-band 
    resolve_status integer, --/D Resolve status of object 
    w1_mag real, --/U mag --/D WISE AllSky magnitude of the object, W1-band 
    w1_mag_err real, --/U mag --/D Error on WISE AllSky magnitude of the object, W1-band 
    w1_nanomaggies real, --/U nMgy --/D WISE AllSky flux of the object, W1-band 
    w1_nanomaggies_ivar real, --/U nMgy^{-2} --/D Inverse variance of WISE AllSky flux of the object, W1-band 
    w2_nanomaggies real, --/U nMgy --/D WISE AllSky flux of the object, W2-band 
    w2_nanomaggies_ivar real, --/U nMgy^{-2} --/D Inverse variance of WISE AllSky flux of the object, W2-band 
    has_wise_phot boolean, --/D True if WISE photometry is available for this object 
    objid_targeting bigint, --/D Object ID of target 
    pk bigint NOT NULL --/D primary key for entry in database table 
);


--
-- Name: dr18_gaia_dr2_ruwe; Type: TABLE; Schema: minidb; Owner: -
--

CREATE TABLE minidb.dr18_gaia_dr2_ruwe (
----------------------------------------------------------------------
--/H Table from Gaia DR2 containing the Renormalised Unit Weight Error (RUWE) associated to each source in gaia_source. See https://gea.esac.esa.int/archive/documentation/GDR2/Gaia_archive/chap_datamodel/sec_dm_main_tables/ssec_dm_ruwe.html for more detailed descriptions of the columns
----------------------------------------------------------------------
    source_id bigint NOT NULL, --/D Gaia DR2 unique source identifier 
    ruwe real --/D renormalised unit weight error 
);


--
-- Name: dr18_gaia_dr2_source; Type: TABLE; Schema: minidb; Owner: -
--

CREATE TABLE minidb.dr18_gaia_dr2_source (
----------------------------------------------------------------------
--/H Gaia DR2 Source Table. See https://gea.esac.esa.int/archive/documentation/GDR2/Gaia_archive/chap_datamodel/sec_dm_main_tables/ssec_dm_gaia_source.html for complete details.
----------------------------------------------------------------------
    solution_id bigint, --/D ID that identifies the version of all the subsystems that were used in the generation of the data as well as the input data used 
    designation text, --/D Unique source designation across all Gaia data releases 
    source_id bigint NOT NULL, --/D Unique source identifier within a particular Gaia data release 
    random_index bigint, --/D Random index which can be used to select smaller subsets of the data 
    ref_epoch double precision, --/U Julian Years --/D Time 
    ra double precision, --/U degrees --/D Right Ascension 
    ra_error double precision, --/U degrees --/D Standard error of the right ascension 
    "dec" double precision, --/U degrees --/D Declination 
    dec_error double precision, --/U degrees --/D Standard error of the declination 
    parallax double precision, --/U mas --/D Absolute stellar parallax of the source at the reference epoch 
    parallax_error double precision, --/U mas --/D Standard error of parallax 
    parallax_over_error real, --/D Parallax divided by its error 
    pmra double precision, --/U mas/yr --/D Proper motion in right ascension direction 
    pmra_error double precision, --/U mas/yr --/D Standard error of proper motion in right ascension direction 
    pmdec double precision, --/U mas/yr --/D Proper motion in declination direction 
    pmdec_error double precision, --/U mas/yr --/D Standard error of proper motion in declination direction 
    ra_dec_corr real, --/D Correlation between right ascension and declination 
    ra_parallax_corr real, --/D Correlation between right ascension and parallax 
    ra_pmra_corr real, --/D Correlation between right ascension and proper motion in right ascension 
    ra_pmdec_corr real, --/D Correlation between right ascension and proper motion in declination 
    dec_parallax_corr real, --/D Correlation between declination and parallax 
    dec_pmra_corr real, --/D Correlation between declination and proper motion in right ascension 
    dec_pmdec_corr real, --/D Correlation between declination and proper motion in declination 
    parallax_pmra_corr real, --/D Correlation between parallax and proper motion in right ascension 
    parallax_pmdec_corr real, --/D Correlation between parallax and proper motion in declination 
    pmra_pmdec_corr real, --/D Correlation between proper motion in right ascension and proper motion in declination 
    astrometric_n_obs_al integer, --/D Total number of observations AL 
    astrometric_n_obs_ac integer, --/D Total number of observations AC 
    astrometric_n_good_obs_al integer, --/D Number of good observations AL 
    astrometric_n_bad_obs_al integer, --/D Number of bad observations AL 
    astrometric_gof_al real, --/D Goodness of fit statistic of model wrt along-scan observations 
    astrometric_chi2_al real, --/D AL chi-square value 
    astrometric_excess_noise double precision, --/U mas --/D Excess noise of the source 
    astrometric_excess_noise_sig double precision, --/D Significance of excess noise 
    astrometric_params_solved integer, --/D Which parameters have been solved for 
    astrometric_primary_flag boolean, --/D Flag indicating if this source was used as a primary source (true) or secondary source (false) 
    astrometric_weight_al real, --/U mas^-2 --/D Mean astrometric weight of the source 
    astrometric_pseudo_colour double precision, --/U um^-1 --/D Astrometrically determined pseudocolour of the source 
    astrometric_pseudo_colour_error double precision, --/U um^-1 --/D Standard error of the pseudocolour of the source 
    mean_varpi_factor_al real, --/D Mean Parallax factor AL 
    astrometric_matched_observations smallint, --/D number of FOV transits matched to this source 
    visibility_periods_used smallint, --/D Number of visibility periods used in the astrometric solution 
    astrometric_sigma5d_max real, --/U mas --/D Longest semi-major axis of the 5-d error ellipsoid 
    frame_rotator_object_type integer, --/D Type of the source mainly used for frame rotation 
    matched_observations smallint, --/D Total number of FOV transits matched to this source 
    duplicated_source boolean, --/D Source with duplicate sources 
    phot_g_n_obs integer, --/D Number of observations contributing to G photometry 
    phot_g_mean_flux double precision, --/U e-/s --/D G-band mean flux 
    phot_g_mean_flux_error double precision, --/U e-/s --/D Error on G-band mean flux 
    phot_g_mean_flux_over_error real, --/D G-band mean flux divided by its error 
    phot_g_mean_mag real, --/U mag --/D G-band mean magnitude 
    phot_bp_n_obs integer, --/D Number of observations contributing to BP photometry 
    phot_bp_mean_flux double precision, --/U e-/s --/D Integrated BP mean flux 
    phot_bp_mean_flux_error double precision, --/U e-/s --/D Error on the integrated BP mean flux 
    phot_bp_mean_flux_over_error real, --/D Integrated BP mean flux divided by its error 
    phot_bp_mean_mag real, --/U mag --/D Integrated BP mean magnitude 
    phot_rp_n_obs integer, --/D Number of observations contributing to RP photometry 
    phot_rp_mean_flux double precision, --/U e-/s --/D Integrated RP mean flux 
    phot_rp_mean_flux_error double precision, --/U e-/s --/D Error on the integrated RP mean flux 
    phot_rp_mean_flux_over_error real, --/D Integrated RP mean flux divided by its error 
    phot_rp_mean_mag real, --/U mag --/D Integrated RP mean magnitude 
    phot_bp_rp_excess_factor real, --/D BP/RP excess factor 
    phot_proc_mode integer, --/D Photometry processing mode 
    bp_rp real, --/U mag --/D BP - RP color 
    bp_g real, --/U mag --/D BP - G color 
    g_rp real, --/U mag --/D G - RP color 
    radial_velocity double precision, --/U km/s --/D Radial velocity 
    radial_velocity_error double precision, --/U km/s --/D Radial velocity error 
    rv_nb_transits integer, --/D Number of transits used to compute radial velocity 
    rv_template_teff real, --/U K --/D Teff of the template used to compute radial velocity 
    rv_template_logg real, --/U log cgs --/D logg of the template used to compute radial velocity 
    rv_template_fe_h real, --/U dex --/D Fe/H of the template used to compute radial velocity 
    phot_variable_flag text, --/D Photometric variability flag 
    l double precision, --/U degrees --/D Galactic longitude 
    b double precision, --/U degrees --/D Galactic latitude 
    ecl_lon double precision, --/U degrees --/D Ecliptic longitude 
    ecl_lat double precision, --/U degrees --/D Ecliptic latitude 
    priam_flags bigint, --/D Flags for the Apsis-Priam results 
    teff_val real, --/U K --/D Stellar effective temperature 
    teff_percentile_lower real, --/U K --/D Teff_val lower uncertainty 
    teff_percentile_upper real, --/U K --/D Teff_val upper uncertainty 
    a_g_val real, --/U mag --/D Line-of-sight extinction in the G band 
    a_g_percentile_lower real, --/U mag --/D A_g_val lower uncertainty 
    a_g_percentile_upper real, --/U mag --/D A_g_val upper uncertainty 
    e_bp_min_rp_val real, --/U mag --/D Line-of-sight reddening E(BP-RP) 
    e_bp_min_rp_percentile_lower real, --/U mag --/D e_bp_min_rp_val lower uncertainty 
    e_bp_min_rp_percentile_upper real, --/U mag --/D e_bp_min_rp_val upper uncertainty 
    flame_flags bigint, --/D Flags for the Apsis-FLAME results 
    radius_val real, --/U Solar Radius --/D Stellar radius 
    radius_percentile_lower real, --/U Solar Radius --/D Radius_val lower uncertainty 
    radius_percentile_upper real, --/U Solar Radius --/D Radius_val upper uncertainty 
    lum_val real, --/U Solar Luminosity --/D stellar luminosity 
    lum_percentile_lower real, --/U Solar Luminosity --/D lum_val lower uncertainty 
    lum_percentile_upper real --/U Solar Luminosity --/D lum_val upper uncertainty 
);


--
-- Name: dr18_gaia_dr2_wd; Type: TABLE; Schema: minidb; Owner: -
--

CREATE TABLE minidb.dr18_gaia_dr2_wd (
----------------------------------------------------------------------
--/H White dwarf catalog of high-probablity WDs from Gentile Fusillo (2019) based on Gaia DR2. Please see https://academic.oup.com/mnras/article/482/4/4570/5162857 for more information on the columns.
----------------------------------------------------------------------
    wd text, --/D WD names from this catalog -- WD J + J2000 ra (hh mm ss.ss) + dec (dd mm ss.s), equinox and epoch 2000 
    dr2name text, --/D Unique Gaia source designation 
    source_id bigint NOT NULL, --/D Unique Gaia DR2 source identifier 
    source integer,
    ra double precision, --/U deg --/D Right ascension 
    e_ra double precision, --/U mas --/D Standard error of right ascenscion 
    "dec" double precision, --/U deg --/D Declination 
    e_dec double precision, --/U mas --/D Standard error of declination 
    plx real, --/U mas --/D Absolute stellar parallax of the source at J2015.5 
    e_plx real, --/U mas --/D Standard error of parallax 
    pmra double precision, --/U mas/yr --/D Proper motion in right ascension 
    e_pmra double precision, --/U mas/yr --/D Standard error of proper motion in right ascension 
    pmdec double precision, --/U mas/yr --/D Proper motion in right declination 
    e_pmdec double precision, --/U mas/yr --/D Standard error of proper motion in declination 
    epsi real, --/U mas --/D Measure of the residuals in the astrometric solution 
    amax real, --/U mas --/D 5-dimensional equivalent to the semimajor axis of the Gaia position error ellipse 
    fg_gaia real, --/U e-/s --/D Gaia G-band mean flux 
    e_fg_gaia real, --/U e-/s --/D Error on G-band mean flux 
    g_gaia_mag real, --/U mag --/D Gaia G-band mean magnitude 
    fbp real, --/U e-/s --/D Integrated G_BP mean flux 
    e_fbp real, --/U e-/s --/D Error on integrated G_BP mean flux 
    bpmag real, --/U mag --/D Integrated G_BP mean magnitude 
    frp real, --/U e-/s --/D Integrated G_RP mean flux 
    e_frp real, --/U e-/s --/D Error on integrated G_RP mean flux 
    rpmag real, --/U mag --/D Integrated G_RP mean magnitude 
    e_br_rp real, --/D G_BP/G_RP execess factor
    glon double precision, --/U deg --/D Galactic longitude 
    glat double precision, --/U deg --/D Galactic latitude 
    density real, --/U sq.deg^-1 --/D Number of Gaia sources around this object 
    ag real, --/U mag --/D Extinction in the Gaia G band derived from E(B − V) values from Schlafly and  Finkbeiner 
    sdss text, --/D SDSS object name if available 
    umag real, --/U mag --/D SDSS u-band magnitude 
    e_umag real, --/U mag --/D SDSS u-band magnitude uncertainty 
    gmag real, --/U mag --/D SDSS g-band magnitude uncertainty 
    e_gmag real, --/U mag --/D SDSS g-band magnitude 
    rmag real, --/U mag --/D SDSS r-band magnitude uncertainty 
    e_rmag real, --/U mag --/D SDSS r-band magnitude 
    imag real, --/U mag --/D SDSS i-band magnitude uncertainty 
    e_imag real, --/U mag --/D SDSS i-band magnitude 
    zmag real, --/U mag --/D SDSS z-band magnitude uncertainty 
    e_zmag real, --/U mag --/D SDSS z-band magnitude 
    pwd real, --/D Probability of being a white dwarf 
    f_pwd integer, --/D Flag on probability of being a white dwarf 
    teffh real, --/U K --/D Effective temperature from fitting the dereddened G, GBP, and GRP absolute fluxes with pure-H model atmospheres 
    e_teffh real, --/U K --/D Uncertainty on Teff from pure-H model atmospheres 
    loggh real, --/U dex cgs --/D Surface gravity from fitting the dereddened G, GBP, and GRP absolute fluxes with pure-H model atmospheres 
    e_loggh real, --/U dex cgs --/D Uncertainty on log g from pure-H model atmospheres 
    massh real, --/U Solar masses --/D Stellar mass assuming pure-H model atmospheres 
    e_massh real, --/U Solar masses --/D Uncertainty on the mass assuming pure-H model atmospheres 
    chi2h real, --/D Chi^2 value of the pure-H fit 
    teffhe real, --/U K --/D Effective temperature from fitting the dereddened G, GBP, and GRP absolute fluxes with pure-He model atmospheres 
    e_teffhe real, --/U K --/D Uncertainty on Teff from pure-He model atmospheres 
    logghe real, --/U dex cgs --/D Surface gravity from fitting the dereddened G, GBP, and GRP absolute fluxes with pure-He model atmospheres 
    e_logghe real, --/U dex cgs --/D Uncertainty on log g from pure-He model atmospheres 
    masshe real, --/U Solar masses --/D Stellar mass assuming pure-He model atmospheres 
    e_masshe real, --/U Solar masses --/D Uncertainty on the mass assuming pure-H model atmospheres 
    chisqhe real --/D Chi^2 value of the pure-H fit 
);


--
-- Name: dr18_gaia_unwise_agn; Type: TABLE; Schema: minidb; Owner: -
--

CREATE TABLE minidb.dr18_gaia_unwise_agn (
----------------------------------------------------------------------
--/H AGN identified using information from WISE and Gaia DR2 from the catalog of Shu et al. 2019. See complete information on the columns in https://academic.oup.com/mnras/article/489/4/4741/5561523
----------------------------------------------------------------------
    ra double precision, --/U degrees --/D Right ascension from Gaia DR2 
    "dec" double precision, --/U degrees --/D Declination from Gaia DR2 
    gaia_sourceid bigint NOT NULL, --/D Unique Gaia DR2 source identifier 
    unwise_objid text, --/D Unique unWISE source identifier 
    plx double precision, --/U mas --/D Parallax from Gaia DR2 
    plx_err double precision, --/U mas --/D Error in parallax from Gaia DR2 
    pmra double precision, --/U mas/yr --/D Proper motion in right ascension from Gaia DR2 
    pmra_err double precision, --/U mas/yr --/D Error in proper motion in right ascension from Gaia DR2 
    pmdec double precision, --/U mas/yr --/D Proper motion in declination from Gaia DR2 
    pmdec_err double precision, --/U mas/yr --/D Error in proper motinon in declination from Gaia DR2 
    plxsig double precision, --/D Parallax significance defined as parallax/parallax_error 
    pmsig double precision, --/D Proper motion significance 
    ebv double precision, --/U mag --/D Galactic E(B-V) reddening from Schlegel et al. 1998 
    n_obs integer, --/D Number of observations contributing to Gaia DR2 G photometry 
    g double precision, --/U mag --/D Gaia DR2 G-band mean magnitude (extinction corrected) 
    bp double precision, --/U mag --/D Gaia DR2 BP-band mean magnitude (extinction corrected) 
    rp double precision, --/U mag --/D Gaia DR2 RP-band mean magnitude (extinction corrected) 
    w1 double precision, --/U mag --/D unWISE W1-band magnitude 
    w2 double precision, --/U mag --/D unWISE W2-band magnitude 
    bp_g double precision, --/U mag --/D Gaia DR2 BP − G color (extinction corrected) 
    bp_rp double precision, --/U mag --/D Gaia DR2 BP − RP color (extinction corrected) 
    g_rp double precision, --/U mag --/D Gaia DR2 G − RP color (extinction corrected) 
    g_w1 double precision, --/U mag --/D Gaia DR2 G − unWISE W1 color (extinction corrected) 
    gw_sep double precision, --/U arcsec --/D Separation between a Gaia source and its unWISE counterpart 
    w1_w2 double precision, --/U mag --/D unWISE W1 −W2 color 
    g_var double precision, --/D Variation in GaiaG-band flux 
    bprp_ef double precision, --/D BP/RP excess factor from Gaia DR2 
    aen double precision, --/U mas --/D Astrometric excess noise from Gaia DR2 
    gof double precision, --/D Goodness-of-fit statistic of the astrometric solution from Gaia DR2 
    cnt1 integer, --/D Number of Gaia DR2 sources within a 1 arcsec radius circular aperture 
    cnt2 integer, --/D Number of Gaia DR2 sources within a 2 arcsec radius circular aperture 
    cnt4 integer, --/D Number of Gaia DR2 sources within a 4 arcsec radius circular aperture 
    cnt8 integer, --/D Number of Gaia DR2 sources within a 8 arcsec radius circular aperture 
    cnt16 integer, --/D Number of Gaia DR2 sources within a 16 arcsec radius circular aperture 
    cnt32 integer, --/D Number of Gaia DR2 sources within a 32 arcsec radius circular aperture 
    phot_z double precision, --/D Photometric redshift 
    prob_rf double precision --/D AGN probability 
);


--
-- Name: dr18_gaiadr2_tmass_best_neighbour; Type: TABLE; Schema: minidb; Owner: -
--

CREATE TABLE minidb.dr18_gaiadr2_tmass_best_neighbour (
----------------------------------------------------------------------
--/H The Gaia DR2 vs. 2MASS PSC crossmatch provided by the Gaia collaboration. Please see https://gea.esac.esa.int/archive/documentation/GDR2/Catalogue_consolidation/chap_cu9val_cu9val/ssec_cu9xma/sssec_cu9xma_extcat.html for complete details.
----------------------------------------------------------------------
    tmass_oid bigint, --/D Additional numeric unique source identifier of 2MASS, increasing with declination 
    number_of_neighbours integer, --/D Number of sources in the 2MASS Catalogue which match the Gaia source within position errors 
    number_of_mates integer, --/D Number of other Gaia sources that have as best-neighbour the same 2MASS source.
    best_neighbour_multiplicity integer, --/D Number of neighbours with same probability as best neighbour 
    source_id bigint NOT NULL, --/D Unique Gaia DR2 source identifier 
    original_ext_source_id character(17), --/D The unique source identifier in the original 2MASS catalogue 
    angular_distance double precision, --/U arcsec --/D Angular distance between the two sources 
    gaia_astrometric_params integer, --/D Number of Gaia astrometric params used 
    tmass_pts_key integer --/D key for crossmatch 
);


--
-- Name: dr18_geometric_distances_gaia_dr2; Type: TABLE; Schema: minidb; Owner: -
--

CREATE TABLE minidb.dr18_geometric_distances_gaia_dr2 (
----------------------------------------------------------------------
--/H Bayesian distances from Gaia DR2 parameters from Bailer-Jones et al. 2018. For complete details, see the original paper: https://iopscience.iop.org/article/10.3847/1538-3881/aacb21/pdf
----------------------------------------------------------------------
    source_id bigint NOT NULL, --/D Unique Gaia DR2 source identifier 
    r_est real, --/U pc --/D Estimated distance 
    r_lo real, --/U pc --/D Lower bound on the confidence interval of the estimated distance 
    r_hi real, --/U pc --/D Upper bound on the confidence interval of the estimated distance 
    r_len real, --/U pc --/D Length scale used in the prior for the distance estimation 
    result_flag character(1), --/D Result flag 
    modality_flag smallint --/D Number of modes in the posterior 
);


--
-- Name: dr18_glimpse; Type: TABLE; Schema: minidb; Owner: -
--

CREATE TABLE minidb.dr18_glimpse (
----------------------------------------------------------------------
--/H GLIMPSE catalog (I, II and 3-D). See full documentation at https://irsa.ipac.caltech.edu/data/SPITZER/GLIMPSE/doc/glimpse1_dataprod_v2.0.pdf
----------------------------------------------------------------------
    designation text, --/D position-based designation in Galactic coordinates 
    tmass_designation character varying(18), --/D 2MASS designation from PSC 
    tmass_cntr integer, --/D 2MASS counter 
    l double precision, --/U degrees --/D Galactic longitude 
    b double precision, --/U degrees --/D Galactic latitude 
    dl double precision, --/U degrees --/D uncertaintiy in Galactic longitude 
    db double precision, --/U degrees --/D uncertainty in Galactic latitude 
    ra double precision, --/U degrees --/D right ascension 
    "dec" double precision, --/U degrees --/D declination 
    dra double precision, --/U degrees --/D uncertainity in RA 
    ddec double precision, --/U degrees --/D uncertainity in Dec 
    csf integer, --/D close source flag (see GLIMPSE documentation for details) 
    mag_j real, --/U mag --/D 2MASS J-band magnitude 
    dj_m real, --/U mag --/D uncertainity in 2MASS J-band magnitude 
    mag_h real, --/U mag --/D 2MASS H-band magnitude 
    dh_m real, --/U mag --/D uncertainity in 2MASS H-band magnitude 
    mag_ks real, --/U mag --/D 2MASS Ks-band magnitude 
    dks_m real, --/U mag --/D uncertainity in 2MASS Ks-band magnitude 
    mag3_6 real, --/U mag --/D IRAC 3.6-band magnitude 
    d3_6m real, --/U mag --/D uncertainty in IRAC 3.6-band magnitude 
    mag4_5 real, --/U mag --/D IRAC 4.5-band magnitude 
    d4_5m real, --/U mag --/D uncertainty in IRAC 4.5-band magnitude 
    mag5_8 real, --/U mag --/D IRAC 5.8-band magnitude 
    d5_8m real, --/U mag --/D uncertainty in IRAC 5.8-band magnitude 
    mag8_0 real, --/U mag --/D IRAC 8.0-band magnitude 
    d8_0m real, --/U mag --/D uncertainty in IRAC 8.0-band magnitude 
    f_j real, --/U mJy --/D 2MASS J-band flux 
    df_j real, --/U mJy --/D uncertainity in 2MASS J-band flux 
    f_h real, --/U mJy --/D 2MASS H-band flux 
    df_h real, --/U mJy --/D uncertainty in 2MASS H-band flux 
    f_ks real, --/U mJy --/D 2MASS Ks-band flux 
    df_ks real, --/U mJy --/D uncertainity in 2MASS Ks-band flux 
    f3_6 real, --/U mJy --/D IRAC 3.6-band flux 
    df3_6 real, --/U mJy --/D uncertainty in IRAC 3.6-band flux 
    f4_5 real, --/U mJy --/D IRAC 4.5-band flux 
    df4_5 real, --/U mJy --/D uncertainty in IRAC 4.5-band flux 
    f5_8 real, --/U mJy --/D IRAC 5.8-band flux 
    df5_8 real, --/U mJy --/D uncertainty in IRAC 5.8-band flux 
    f8_0 real, --/U mJy --/D IRAC 8.0-band flux 
    df8_0 real, --/U mJy --/D uncertainty in IRAC 8.0-band flux 
    rms_f3_6 real, --/U mJy --/D RMS deviation of the individual detections from final flux in IRAC 3.6-band 
    rms_f4_5 real, --/U mJy --/D RMS deviation of the individual detections from final flux in IRAC 4.5-band 
    rms_f5_8 real, --/U mJy --/D RMS deviation of the individual detections from final flux in IRAC 5.8-band 
    rms_f8_0 real, --/U mJy --/D RMS deviation of the individual detections from final flux in IRAC 8.0-band 
    sky_3_6 real, --/U mJy/sr --/D local background sky in IRAC 3.6-band 
    sky_4_5 real, --/U mJy/sr --/D local background sky in IRAC 4.5-band 
    sky_5_8 real, --/U mJy/sr --/D local background sky in IRAC 5.8-band 
    sky_8_0 real, --/U mJy/sr --/D local background sky in IRAC 8.0-band 
    sn_j real, --/D j_snr in 2MASS J-band 
    sn_h real, --/D h_snr from 2MASS catalog 
    sn_ks real, --/D ks_snr from 2MASS catalog 
    sn_3_6 real, --/D (flux)/(uncertainty in flux) in IRAC 3.5-band 
    sn_4_5 real, --/D (flux)/(uncertainty in flux) in IRAC 4.5-band 
    sn_5_8 real, --/D (flux)/(uncertainty in flux) in IRAC 5.8-band 
    sn_8_0 real, --/D (flux)/(uncertainty in flux) in IRAC 8.0-band 
    dens_3_6 real, --/U #/sqarcmin --/D local source density in IRAC 3.6-band 
    dens_4_5 real, --/U #/sqarcmin --/D local source density in IRAC 4.5-band 
    dens_5_8 real, --/U #/sqarcmin --/D local source density in IRAC 5.8-band 
    dens_8_0 real, --/U #/sqarcmin --/D local source density in IRAC 8.0-band 
    m3_6 integer, --/D number of source detections in IRAC 3.6-band 
    m4_5 integer, --/D number of source detections in IRAC 4.5-band 
    m5_8 integer, --/D number of source detections in IRAC 5.8-band 
    m8_0 integer, --/D number of source detections in IRAC 8.0-band 
    n3_6 integer, --/D number of observations in IRAC 3.6-band 
    n4_5 integer, --/D number of observations in IRAC 4.5-band 
    n5_8 integer, --/D number of observations in IRAC 5.8-band 
    n8_0 integer, --/D number of observations in IRAC 8.0-band 
    sqf_j integer, --/D source quality flag for 2MASS J-band (see GLIMPSE documentation for details) 
    sqf_h integer, --/D source quality flag for 2MASS H-band (see GLIMPSE documentation for details) 
    sqf_ks integer, --/D source quality flag for 2MASS Ks-band (see GLIMPSE documentation for details) 
    sqf_3_6 integer, --/D source quality flag for IRAC 3.6-band (see GLIMPSE documentation for details) 
    sqf_4_5 integer, --/D source quality flag for IRAC 4.5-band (see GLIMPSE documentation for details) 
    sqf_5_8 integer, --/D source quality flag for IRAC 5.8-band (see GLIMPSE documentation for details) 
    sqf_8_0 integer, --/D source quality flag for IRAC 8.0-band (see GLIMPSE documentation for details) 
    mf3_6 integer, --/D method flag for IRAC 3.6-band (see GLIMPSE documentation for details) 
    mf4_5 integer, --/D method flag for IRAC 4.5-band (see GLIMPSE documentation for details) 
    mf5_8 integer, --/D method flag for IRAC 5.8-band (see GLIMPSE documentation for details) 
    mf8_0 integer, --/D method flag for IRAC 8.0-band (see GLIMPSE documentation for details) 
    pk bigint NOT NULL --/D primary key 
);


--
-- Name: dr18_guvcat; Type: TABLE; Schema: minidb; Owner: -
--

CREATE TABLE minidb.dr18_guvcat (
----------------------------------------------------------------------
--/H GALEX unique source catalog from Bianchi et al. 2017 (https://iopscience.iop.org/article/10.3847/1538-4365/aa7053/pdf). For more details on the column descriptions see https://archive.stsci.edu/hlsp/guvcat/guvcat-column-description
----------------------------------------------------------------------
    objid bigint NOT NULL, --/D GALEX identifier for the source 
    photoextractid bigint, --/D Pointer to GALEX photoExtract Table (identifier of original observation) 
    mpstype text, --/D Survey type ("AIS") 
    avaspra double precision, --/U degrees --/D R.A. of center of field where object was measured 
    avaspdec double precision, --/U degrees --/D Declination of center of field where object was measured 
    fexptime real, --/U seconds --/D FUV exposure time 
    nexptime real, --/U seconds --/D NUV exposure time 
    ra double precision, --/U degrees --/D Source's right ascension 
    "dec" double precision, --/U degrees --/D Source's declination 
    glon double precision, --/U degrees --/D Source's Galactic longitude 
    glat double precision, --/U degrees --/D Source's Galactic latitude 
    tilenum integer, --/D "Tile" number 
    img integer, --/D Image number 
    subvisit integer, --/D Number of subvisit if exposure was divided 
    fov_radius real, --/D Distance of source from center of the field in which it was measured 
    type integer, --/D Obs. type (0=single, 1=multi) 
    band integer, --/D Band number (1=NUV, 2=FUV, 3=both) 
    e_bv real, --/U mag --/D E(B-V) Galactic reddening from Schlegel et al. 1998 maps) 
    istherespectrum smallint, --/D Does this object have a GALEX spectrum? 
    chkobj_type smallint, --/D Astrometry check type 
    fuv_mag real, --/U mag --/D FUV calibrated magnitude 
    fuv_magerr real, --/U mag --/D FUV calibrated magnitude error 
    nuv_mag real, --/U mag --/D NUV calibrated magnitude 
    nuv_magerr real, --/U mag --/D NUV calibrated magnitude error 
    fuv_mag_auto real, --/U mag --/D FUV Kron-like elliptical aperture magnitude 
    fuv_magerr_auto real, --/U mag --/D FUV rms error for AUTO magnitude 
    nuv_mag_auto real, --/U mag --/D NUV Kron-like elliptical aperture magnitude 
    nuv_magerr_auto real, --/U mag --/D NUV rms error for AUTO magnitude 
    fuv_mag_aper_4 real, --/U mag --/D FUV magnitude aperture (8 pixel) 
    fuv_magerr_aper_4 real, --/U mag --/D FUV magnitude error aperture (8 pixel) 
    nuv_mag_aper_4 real, --/U mag --/D NUV magnitude aperture (8 pixel) 
    nuv_magerr_aper_4 real, --/U mag --/D NUV magnitude error aperture (8 pixel) 
    fuv_mag_aper_6 real, --/U mag --/D FUV magnitude aperture (17 pixel) 
    fuv_magerr_aper_6 real, --/U mag --/D FUV magnitude error aperture (17 pixel) 
    nuv_mag_aper_6 real, --/U mag --/D NUV magnitude aperture (17 pixel) 
    nuv_magerr_aper_6 real, --/U mag --/D NUV magnitude error aperture (17 pixel) 
    fuv_artifact smallint, --/D FUV artifact flag 
    nuv_artifact smallint, --/D NUV artifact flag 
    fuv_flags smallint, --/D FUV extraction flags 
    nuv_flags smallint, --/D NUV extraction flags 
    fuv_flux real, --/U mJy --/D FUV calibrated flux 
    fuv_fluxerr real, --/U mJy --/D FUV calibrated flux error 
    nuv_flux real, --/U mJy --/D NUV calibrated flux 
    nuv_fluxerr real, --/U mJy --/D NUV calibrated flux error 
    fuv_x_image real, --/D FUV object position along x 
    fuv_y_image real, --/D FUV object position along y 
    nuv_x_image real, --/D NUV object position along x 
    nuv_y_image real, --/D NUV object position along y 
    fuv_fwhm_image real, --/D FUV FWHM assuming a Gaussian core 
    nuv_fwhm_image real, --/D NUV FWHM assuming a Gaussian core 
    fuv_fwhm_world real, --/D FUV FWHM assuming a Gaussian core (WORLD units) 
    nuv_fwhm_world real, --/D NUV FWHM assuming a Gaussian core (WORLD units) 
    nuv_class_star real, --/D NUV Star/Galaxy classifier 
    fuv_class_star real, --/D FUV Star/Galaxy classifier 
    nuv_ellipticity real, --/D NUV (1. - B_IMAGE/A_IMAGE) 
    fuv_ellipticity real, --/D FUV (1. - B_IMAGE/A_IMAGE) 
    nuv_theta_j2000 real, --/U degrees --/D NUV position angle (east of north) (J2000) 
    nuv_errtheta_j2000 real, --/U degrees --/D NUV position angle error (east of north) (J2000) 
    fuv_theta_j2000 real, --/U degrees --/D FUV position angle (east of north) (J2000) 
    fuv_errtheta_j2000 real, --/U degrees --/D FUV position angle error (east of north) (J2000) 
    fuv_ncat_fwhm_image real, --/U pixels --/D FUV FWHM_IMAGE value from -fd-ncat.fits 
    fuv_ncat_flux_radius_3 real, --/D FUV FLUX_RADIUS using Aperture 
    nuv_kron_radius real, --/D NUV Kron apertures in units of A or B 
    nuv_a_world real, --/D NUV profile rms along major axis (world units) 
    nuv_b_world real, --/D NUV profile rms along minor axis (world units) 
    fuv_kron_radius real, --/D FUV Kron apertures in units of A or B 
    fuv_a_world real, --/D FUV profile rms along major axis (world units) 
    fuv_b_world real, --/D FUV profile rms along minor axis (world units) 
    nuv_weight real, --/U seconds --/D NUV effective exposure (flat-field response value) at the source position 
    fuv_weight real, --/U seconds --/D FUV effective exposure (flat-field response value) at the source position 
    prob real, --/D Probability of the FUV-NUV cross-match 
    sep real, --/D Separation between the FUV and NUV position of the source in the same observation 
    nuv_poserr real, --/U arcsec --/D Position error of the source in the NUV image 
    fuv_poserr real, --/U arcsec --/D Position error of the source in the FUV image 
    ib_poserr real, --/U arcsec --/D Inter-band position error 
    nuv_pperr real, --/D NUV Poisson position error 
    fuv_pperr real, --/D FUV Poisson position error 
    corv text, --/D Whether the source comes from a coadd or visit 
    grank smallint, --/D rank of source with 2.5 arcsec of primary 
    ngrank smallint, --/D If this is a primary, the number of sources within 2.5 arcsec 
    primgid bigint, --/D OBJID of the primary 
    groupgid text, --/D OBJID's of all AIS sources within 2.5 arcseconds concatenated by a "+" 
    grankdist smallint, --/D Same for GRANK, but based on distance criterion 
    ngrankdist bigint, --/D Same for NGRANK, but based on distance criterion 
    primgiddist bigint, --/D Same for PRIMGID, but based on distance criterion 
    groupgiddist text, --/D Same for GROUPGID, but based on distance criterion 
    groupgidtot text, --/D OBJID's of all sources within 2.5 arcseconds 
    difffuv real, --/U mag --/D FUV magnitude difference between primary and secondary 
    diffnuv real, --/U mag --/D NUV magnitude difference between primary and secondary 
    difffuvdist real, --/U mag --/D FUV magnitude difference between primary and secondary, but based on distance criterion 
    diffnuvdist real, --/U mag --/D NUV magnitude difference between primary and secondary, but based on distance criterion 
    sepas real, --/U arcsec --/D Separation between primary and secondary 
    sepasdist real, --/U arcsec --/D Separation between primary and secondary, but based on distance criterion 
    inlargeobj text, --/D Is source in the footprint of an extended object? 
    largeobjsize real --/D Size of the extended object 
);


--
-- Name: dr18_instrument; Type: TABLE; Schema: minidb; Owner: -
--

CREATE TABLE minidb.dr18_instrument (
----------------------------------------------------------------------
--/H This table stores the instruments used by SDSS-V.
----------------------------------------------------------------------
    pk integer NOT NULL, --/D The primary key. A sequential identifier.
    label text, --/D The name of the instrument.
    default_lambda_eff real --/U angstrom --/D The default wavelength for which fibre positioning will be optimised 
);


--
-- Name: dr18_legacy_survey_dr8; Type: TABLE; Schema: minidb; Owner: -
--

CREATE TABLE minidb.dr18_legacy_survey_dr8 (
    release integer,
    brickid bigint,
    brickname text,
    objid bigint,
    type text,
    ra double precision,
    "dec" double precision,
    ra_ivar real,
    dec_ivar real,
    dchisq_psf real,
    dchisq_rex real,
    dchisq_dev real,
    dchisq_exp real,
    dchisq_comp real,
    ebv real,
    flux_g real,
    flux_r real,
    flux_z real,
    flux_w1 real,
    flux_w2 real,
    flux_w3 real,
    flux_w4 real,
    flux_ivar_g real,
    flux_ivar_r real,
    flux_ivar_z real,
    flux_ivar_w1 real,
    flux_ivar_w2 real,
    flux_ivar_w3 real,
    flux_ivar_w4 real,
    mw_transmission_g real,
    mw_transmission_r real,
    mw_transmission_z real,
    mw_transmission_w1 real,
    mw_transmission_w2 real,
    mw_transmission_w3 real,
    mw_transmission_w4 real,
    nobs_g integer,
    nobs_r integer,
    nobs_z integer,
    nobs_w1 integer,
    nobs_w2 integer,
    nobs_w3 integer,
    nobs_w4 integer,
    rchisq_g real,
    rchisq_r real,
    rchisq_z real,
    rchisq_w1 real,
    rchisq_w2 real,
    rchisq_w3 real,
    rchisq_w4 real,
    fracflux_g real,
    fracflux_r real,
    fracflux_z real,
    fracflux_w1 real,
    fracflux_w2 real,
    fracflux_w3 real,
    fracflux_w4 real,
    fracmasked_g real,
    fracmasked_r real,
    fracmasked_z real,
    fracin_g real,
    fracin_r real,
    fracin_z real,
    anymask_g integer,
    anymask_r integer,
    anymask_z integer,
    allmask_g integer,
    allmask_r integer,
    allmask_z integer,
    wisemask_w1 smallint,
    wisemask_w2 smallint,
    psfsize_g real,
    psfsize_r real,
    psfsize_z real,
    psfdepth_g real,
    psfdepth_r real,
    psfdepth_z real,
    galdepth_g real,
    galdepth_r real,
    galdepth_z real,
    psfdepth_w1 real,
    psfdepth_w2 real,
    wise_coadd_id text,
    fracdev real,
    fracdev_ivar real,
    shapedev_r real,
    shapedev_r_ivar real,
    shapedev_e1 real,
    shapedev_e1_ivar real,
    shapedev_e2 real,
    shapedev_e2_ivar real,
    shapeexp_r real,
    shapeexp_r_ivar real,
    shapeexp_e1 real,
    shapeexp_e1_ivar real,
    shapeexp_e2 real,
    shapeexp_e2_ivar real,
    fiberflux_g real,
    fiberflux_r real,
    fiberflux_z real,
    fibertotflux_g real,
    fibertotflux_r real,
    fibertotflux_z real,
    ref_cat text,
    ref_id bigint,
    ref_epoch real,
    gaia_phot_g_mean_mag real,
    gaia_phot_g_mean_flux_over_error real,
    gaia_phot_bp_mean_mag real,
    gaia_phot_bp_mean_flux_over_error real,
    gaia_phot_rp_mean_mag real,
    gaia_phot_rp_mean_flux_over_error real,
    gaia_astrometric_excess_noise real,
    gaia_duplicated_source boolean,
    gaia_phot_bp_rp_excess_factor real,
    gaia_astrometric_sigma5d_max real,
    gaia_astrometric_params_solved smallint,
    parallax real,
    parallax_ivar real,
    pmra real,
    pmra_ivar real,
    pmdec real,
    pmdec_ivar real,
    maskbits integer,
    ls_id bigint NOT NULL,
    tycho_ref bigint,
    gaia_sourceid bigint
);


--
-- Name: dr18_magnitude; Type: TABLE; Schema: minidb; Owner: -
--

CREATE TABLE minidb.dr18_magnitude (
----------------------------------------------------------------------
--/H This table stores magnitude information for a target. Optical magnitudes that are not selected from SDSS photometry have been converted to the SDSS system.
----------------------------------------------------------------------
    carton_to_target_pk integer, --/D The primary key of the target in the dr18_carton_to_target table.
    magnitude_pk bigint NOT NULL, --/D The primary key. A sequential identifier.
    g real, --/D The optical g magnitude.
    r real, --/D The optical r magnitude.
    i real, --/D The optical i magnitude.
    h real, --/D The IR H magnitude.
    bp real, --/D The Gaia BP magnitude.
    rp real, --/D The Gaia RP magnitude.
    z real, --/D The optical z magnitude.
    j real, --/D The IR J magnitude.
    k real, --/D The IR K magnitude.
    gaia_g real, --/D The Gaia G magnitude.
    optical_prov text --/D The source of the optical magnitudes.
);


--
-- Name: dr18_mapper; Type: TABLE; Schema: minidb; Owner: -
--

CREATE TABLE minidb.dr18_mapper (
----------------------------------------------------------------------
--/H This table stores the names of the mappers associated with cartons in dr18_carton.
----------------------------------------------------------------------
    pk integer NOT NULL, --/D The primary key. A sequential identifier. 
    label text --/D The name of the mapper. 
);


--
-- Name: dr18_panstarrs1; Type: TABLE; Schema: minidb; Owner: -
--

CREATE TABLE minidb.dr18_panstarrs1 (
----------------------------------------------------------------------
--/H A copy of the PanSTARRS1-dr2 catalogue provided by E. Magnier. Based on the internal IPP database representation mainyaned by IfA, U. Hawaii. Column names may differ from publically available catalogues hosted at MAST (mapping provided in column descriptions). The SDSS-V copy of this database is derived from a combination of the PS1-dr2 StackObjectThin and ObjectThin tables (https://outerspace.stsci.edu/display/PANSTARRS/PS1+Database+object+and+detection+tables). The catalogue contains PSF, Kron, and Aper measurements based on stacked and forced warp photometry, and expressed as fluxes, including measurements are made of low-significance detections. The average exposure (chip) measurements are expressed in magnitudes since photometry is not measured at this stage for sources with S/N < 5, so there should not be any negative fluxes. Magnitudes are on the AB system, fluxes are in Janskys. Conversion to AB mags is via: mag = 8.9 - 2.5*log10(flux).
----------------------------------------------------------------------
    ra double precision, --/U deg --/D mean RA, (J2000, tied to Gaia DR1) 
    "dec" double precision, --/U deg --/D mean Dec, (J2000, tied to Gaia DR1) 
    dra real, --/U arcsec --/D error on RA 
    ddec real, --/U arcsec --/D error on DEC 
    tmean real, --/U days --/D Mean epoch (MJD) 
    trange real, --/U days --/D Time range -- may include 2MASS values 
    chisqpos real, --/D chi-square of a fixed position astrometry solution (equiv to ObjectThin.posMeanChisq)
    stargal real, --/D Measure of extendedness. Computed as the median across all chip measurements of extNsigma, where extNsigma = (PSF mag - Kron mag) expressed as a number of sigmas, so it somewhat adjusts for the spread at low signal-to-noise.
    nmeas integer, --/D total number of measurements in databases (including non-PS1 data)
    nwarp_ok integer, --/D number of warps with psf_qf > 0 (any unmasked pixels)
    flags integer, --/D ObjectInfoFlags
    objid integer, --/D internal Pan-STARRS IPP object ID : unique within database spatial partition (see catID)
    catid integer, --/D database spatial partition ID - (equiv. to StackObjectThin.dvoRegionID)
    extid_hi integer, --/D upper 32 bits of PSPS object ID (objID in MAST PSPS database)
    extid_lo integer, --/D lower 32 bits of PSPS object ID (objID in MAST PSPS database)
    g_chp_psf real, --/U mag --/D mean g-band chip PSF magnitude 
    g_chp_psf_err real, --/U mag --/D error on mean g-band chip PSF magnitude 
    g_chp_psf_nphot integer, --/D number of measurements used for g_chp_psf (excluding outliers)
    g_chp_aper real, --/U mag --/D mean g-band chip seeing-adapted aperture magnitude 
    g_chp_aper_err real, --/U mag --/D error on mean g-band chip seeing-adapted aperture magnitude 
    g_chp_aper_nphot integer, --/D number of measurements used for above (excluding outliers)
    g_chp_kron real, --/U mag --/D mean g-band chip Kron magnitude 
    g_chp_kron_err real, --/U mag --/D error on mean g-band chip Kron magnitude 
    g_chp_kron_nphot integer, --/D number of measurements used for g_chp_kron (excluding outliers)
    g_stk_psf_flux real, --/U Jy --/D best g-band stack PSF flux 
    g_stk_psf_fluxerr real, --/U Jy --/D error on best g-band stack PSF flux 
    g_stk_psf_nphot integer, --/D number of measurements used for g_stk_psf_flux (excluding outliers)
    g_stk_aper_flux real, --/U Jy --/D g-band stack seeing-adapted aperture flux 
    g_stk_aper_fluxerr real, --/U Jy --/D error on g-band stack seeing-adapted aperture flux 
    g_stk_aper_nphot integer, --/D number of measurements used for g_stk_aper_flux (excluding outliers)
    g_stk_kron_flux real, --/U Jy --/D g-band stack Kron flux from same stack as 'best' PSF above 
    g_stk_kron_fluxerr real, --/U Jy --/D error on g-band stack Kron flux from same stack as 'best' PSF above 
    g_stk_kron_nphot integer, --/D number of measurements used for g_stk_kron_flux (excluding outliers)
    g_wrp_psf_flux real, --/U Jy --/D mean g-band forced-warp PSF flux 
    g_wrp_psf_fluxerr real, --/U Jy --/D error on mean g-band forced-warp PSF flux 
    g_wrp_psf_nphot integer, --/D number of measurements used for g_wrp_psf_flux (excluding outliers)
    g_wrp_aper_flux real, --/U Jy --/D mean g-band forced-warp seeing-adapted aperture flux 
    g_wrp_aper_fluxerr real, --/U Jy --/D error on mean g-band forced-warp seeing-adapted aperture flux 
    g_wrp_aper_nphot integer, --/D number of measurements used for g_wrp_aper_flux (excluding outliers)
    g_wrp_kron_flux real, --/U Jy --/D mean g-band forced-warp Kron flux 
    g_wrp_kron_fluxerr real, --/U Jy --/D error on mean g-band forced-warp Kron flux 
    g_wrp_kron_nphot integer, --/D number of measurements used for g_wrp_kron_flux (excluding outliers)
    g_flags integer, --/D per-filter info flags (equiv. to StackObjectThin.ginfoFlag4)
    g_ncode integer, --/D number of chip detections in this filter (equiv. to StackObjectThin.ng)
    g_nwarp integer, --/D number of warp measurements in this filter (including primary & secondary skycells)
    g_nwarp_good integer, --/D number of warp measurements with psfqfperf > 0.85 in this filter (including primary & secondary skycells)
    g_nstack integer, --/D number of stack measurements (primary and secondary)
    g_nstack_det integer, --/D number of stack detections (S/N > 5, primary and secondary)
    g_psfqf real, --/D g-band PSF coverage factor
    g_psfqfperf real, --/D g-band PSF weighted fraction of pixels totally unmasked
    r_chp_psf real, --/U mag --/D mean r-band chip PSF magnitude 
    r_chp_psf_err real, --/U mag --/D error on mean r-band chip PSF magnitude 
    r_chp_psf_nphot integer, --/D number of measurements used for r_chp_psf (excluding outliers)
    r_chp_aper real, --/U mag --/D mean r-band chip seeing-adapted aperture magnitude 
    r_chp_aper_err real, --/U mag --/D error on mean r-band chip seeing-adapted aperture magnitude 
    r_chp_aper_nphot integer, --/D number of measurements used for above (excluding outliers)
    r_chp_kron real, --/U mag --/D mean r-band chip Kron magnitude 
    r_chp_kron_err real, --/U mag --/D error on mean r-band chip Kron magnitude 
    r_chp_kron_nphot integer, --/D number of measurements used for r_chp_kron (excluding outliers)
    r_stk_psf_flux real, --/U Jy --/D best r-band stack PSF flux 
    r_stk_psf_fluxerr real, --/U Jy --/D error on best r-band stack PSF flux 
    r_stk_psf_nphot integer, --/D number of measurements used for r_stk_psf_flux (excluding outliers)
    r_stk_aper_flux real, --/U Jy --/D r-band stack seeing-adapted aperture flux 
    r_stk_aper_fluxerr real, --/U Jy --/D error on r-band stack seeing-adapted aperture flux 
    r_stk_aper_nphot integer, --/D number of measurements used for r_stk_aper_flux (excluding outliers)
    r_stk_kron_flux real, --/U Jy --/D r-band stack Kron flux from same stack as 'best' PSF above 
    r_stk_kron_fluxerr real, --/U Jy --/D error on r-band stack Kron flux from same stack as 'best' PSF above 
    r_stk_kron_nphot integer, --/D number of measurements used for r_stk_kron_flux (excluding outliers)
    r_wrp_psf_flux real, --/U Jy --/D mean r-band forced-warp PSF flux 
    r_wrp_psf_fluxerr real, --/U Jy --/D error on mean r-band forced-warp PSF flux 
    r_wrp_psf_nphot integer, --/D number of measurements used for r_wrp_psf_flux (excluding outliers)
    r_wrp_aper_flux real, --/U Jy --/D mean r-band forced-warp seeing-adapted aperture flux 
    r_wrp_aper_fluxerr real, --/U Jy --/D error on mean r-band forced-warp seeing-adapted aperture flux 
    r_wrp_aper_nphot integer, --/D number of measurements used for r_wrp_aper_flux (excluding outliers)
    r_wrp_kron_flux real, --/U Jy --/D mean r-band forced-warp Kron flux 
    r_wrp_kron_fluxerr real, --/U Jy --/D error on mean r-band forced-warp Kron flux 
    r_wrp_kron_nphot integer, --/D number of measurements used for r_wrp_kron_flux (excluding outliers)
    r_flags integer, --/D per-filter info flags (equiv. to StackObjectThin.rinfoFlag4)
    r_ncode integer, --/D number of chip detections in this filter (equiv. to StackObjectThin.nr)
    r_nwarp integer, --/D number of warp measurements in this filter (including primary & secondary skycells)
    r_nwarp_good integer, --/D number of warp measurements with psfqfperf > 0.85 in this filter (including primary & secondary skycells)
    r_nstack integer, --/D number of stack measurements (primary and secondary)
    r_nstack_det integer, --/D number of stack detections (S/N > 5, primary and secondary)
    r_psfqf real, --/D r-band PSF coverage factor
    r_psfqfperf real, --/D r-band PSF weighted fraction of pixels totally unmasked
    i_chp_psf real, --/U mag --/D mean i-band chip PSF magnitude 
    i_chp_psf_err real, --/U mag --/D error on mean i-band chip PSF magnitude 
    i_chp_psf_nphot integer, --/D number of measurements used for i_chp_psf (excluding outliers)
    i_chp_aper real, --/U mag --/D mean i-band chip seeing-adapted aperture magnitude 
    i_chp_aper_err real, --/U mag --/D error on mean i-band chip seeing-adapted aperture magnitude 
    i_chp_aper_nphot integer, --/D number of measurements used for above (excluding outliers)
    i_chp_kron real, --/U mag --/D mean i-band chip Kron magnitude 
    i_chp_kron_err real, --/U mag --/D error on mean i-band chip Kron magnitude 
    i_chp_kron_nphot integer, --/D number of measurements used for i_chp_kron (excluding outliers)
    i_stk_psf_flux real, --/U Jy --/D best i-band stack PSF flux 
    i_stk_psf_fluxerr real, --/U Jy --/D error on best i-band stack PSF flux 
    i_stk_psf_nphot integer, --/D number of measurements used for i_stk_psf_flux (excluding outliers)
    i_stk_aper_flux real, --/U Jy --/D i-band stack seeing-adapted aperture flux 
    i_stk_aper_fluxerr real, --/U Jy --/D error on i-band stack seeing-adapted aperture flux 
    i_stk_aper_nphot integer, --/D number of measurements used for i_stk_aper_flux (excluding outliers)
    i_stk_kron_flux real, --/U Jy --/D i-band stack Kron flux from same stack as 'best' PSF above 
    i_stk_kron_fluxerr real, --/U Jy --/D error on i-band stack Kron flux from same stack as 'best' PSF above 
    i_stk_kron_nphot integer, --/D number of measurements used for i_stk_kron_flux (excluding outliers)
    i_wrp_psf_flux real, --/U Jy --/D mean i-band forced-warp PSF flux 
    i_wrp_psf_fluxerr real, --/U Jy --/D error on mean i-band forced-warp PSF flux 
    i_wrp_psf_nphot integer, --/D number of measurements used for i_wrp_psf_flux (excluding outliers)
    i_wrp_aper_flux real, --/U Jy --/D mean i-band forced-warp seeing-adapted aperture flux 
    i_wrp_aper_fluxerr real, --/U Jy --/D error on mean i-band forced-warp seeing-adapted aperture flux 
    i_wrp_aper_nphot integer, --/D number of measurements used for i_wrp_aper_flux (excluding outliers)
    i_wrp_kron_flux real, --/U Jy --/D mean i-band forced-warp Kron flux 
    i_wrp_kron_fluxerr real, --/U Jy --/D error on mean i-band forced-warp Kron flux 
    i_wrp_kron_nphot integer, --/D number of measurements used for i_wrp_kron_flux (excluding outliers)
    i_flags integer, --/D per-filter info flags (equiv. to StackObjectThin.iinfoFlag4)
    i_ncode integer, --/D number of chip detections in this filter (equiv. to StackObjectThin.ni)
    i_nwarp integer, --/D number of warp measurements in this filter (including primary & secondary skycells)
    i_nwarp_good integer, --/D number of warp measurements with psfqfperf > 0.85 in this filter (including primary & secondary skycells)
    i_nstack integer, --/D number of stack measurements (primary and secondary)
    i_nstack_det integer, --/D number of stack detections (S/N > 5, primary and secondary)
    i_psfqf real, --/D i-band PSF coverage factor
    i_psfqfperf real, --/D i-band PSF weighted fraction of pixels totally unmasked
    z_chp_psf real, --/U mag --/D mean z-band chip PSF magnitude 
    z_chp_psf_err real, --/U mag --/D error on mean z-band chip PSF magnitude 
    z_chp_psf_nphot integer, --/D number of measurements used for z_chp_psf (excluding outliers)
    z_chp_aper real, --/U mag --/D mean z-band chip seeing-adapted aperture magnitude 
    z_chp_aper_err real, --/U mag --/D error on mean z-band chip seeing-adapted aperture magnitude 
    z_chp_aper_nphot integer, --/D number of measurements used for above (excluding outliers)
    z_chp_kron real, --/U mag --/D mean z-band chip Kron magnitude 
    z_chp_kron_err real, --/U mag --/D error on mean z-band chip Kron magnitude 
    z_chp_kron_nphot integer, --/D number of measurements used for z_chp_kron (excluding outliers)
    z_stk_psf_flux real, --/U Jy --/D best z-band stack PSF flux 
    z_stk_psf_fluxerr real, --/U Jy --/D error on best z-band stack PSF flux 
    z_stk_psf_nphot integer, --/D number of measurements used for z_stk_psf_flux (excluding outliers)
    z_stk_aper_flux real, --/U Jy --/D z-band stack seeing-adapted aperture flux 
    z_stk_aper_fluxerr real, --/U Jy --/D error on z-band stack seeing-adapted aperture flux 
    z_stk_aper_nphot integer, --/D number of measurements used for z_stk_aper_flux (excluding outliers)
    z_stk_kron_flux real, --/U Jy --/D z-band stack Kron flux from same stack as 'best' PSF above 
    z_stk_kron_fluxerr real, --/U Jy --/D error on z-band stack Kron flux from same stack as 'best' PSF above 
    z_stk_kron_nphot integer, --/D number of measurements used for z_stk_kron_flux (excluding outliers)
    z_wrp_psf_flux real, --/U Jy --/D mean z-band forced-warp PSF flux 
    z_wrp_psf_fluxerr real, --/U Jy --/D error on mean z-band forced-warp PSF flux 
    z_wrp_psf_nphot integer, --/D number of measurements used for z_wrp_psf_flux (excluding outliers)
    z_wrp_aper_flux real, --/U Jy --/D mean z-band forced-warp seeing-adapted aperture flux 
    z_wrp_aper_fluxerr real, --/U Jy --/D error on mean z-band forced-warp seeing-adapted aperture flux 
    z_wrp_aper_nphot integer, --/D number of measurements used for z_wrp_aper_flux (excluding outliers)
    z_wrp_kron_flux real, --/U Jy --/D mean z-band forced-warp Kron flux 
    z_wrp_kron_fluxerr real, --/U Jy --/D error on mean z-band forced-warp Kron flux 
    z_wrp_kron_nphot integer, --/D number of measurements used for z_wrp_kron_flux (excluding outliers)
    z_flags integer, --/D per-filter info flags (equiv. to StackObjectThin.zinfoFlag4)
    z_ncode integer, --/D number of chip detections in this filter (equiv. to StackObjectThin.nz)
    z_nwarp integer, --/D number of warp measurements in this filter (including primary & secondary skycells)
    z_nwarp_good integer, --/D number of warp measurements with psfqfperf > 0.85 in this filter (including primary & secondary skycells)
    z_nstack integer, --/D number of stack measurements (primary and secondary)
    z_nstack_det integer, --/D number of stack detections (S/N > 5, primary and secondary)
    z_psfqf real, --/D z-band PSF coverage factor
    z_psfqfperf real, --/D z-band PSF weighted fraction of pixels totally unmasked
    y_chp_psf real, --/U mag --/D mean y-band chip PSF magnitude 
    y_chp_psf_err real, --/U mag --/D error on mean y-band chip PSF magnitude 
    y_chp_psf_nphot integer, --/D number of measurements used for y_chp_psf (excluding outliers)
    y_chp_aper real, --/U mag --/D mean y-band chip seeing-adapted aperture magnitude 
    y_chp_aper_err real, --/U mag --/D error on mean y-band chip seeing-adapted aperture magnitude 
    y_chp_aper_nphot integer, --/D number of measurements used for above (excluding outliers)
    y_chp_kron real, --/U mag --/D mean y-band chip Kron magnitude 
    y_chp_kron_err real, --/U mag --/D error on mean y-band chip Kron magnitude 
    y_chp_kron_nphot integer, --/D number of measurements used for y_chp_kron (excluding outliers)
    y_stk_psf_flux real, --/U Jy --/D best y-band stack PSF flux 
    y_stk_psf_fluxerr real, --/U Jy --/D error on best y-band stack PSF flux 
    y_stk_psf_nphot integer, --/D number of measurements used for y_stk_psf_flux (excluding outliers)
    y_stk_aper_flux real, --/U Jy --/D y-band stack seeing-adapted aperture flux 
    y_stk_aper_fluxerr real, --/U Jy --/D error on y-band stack seeing-adapted aperture flux 
    y_stk_aper_nphot integer, --/D number of measurements used for y_stk_aper_flux (excluding outliers)
    y_stk_kron_flux real, --/U Jy --/D y-band stack Kron flux from same stack as 'best' PSF above 
    y_stk_kron_fluxerr real, --/U Jy --/D error on y-band stack Kron flux from same stack as 'best' PSF above 
    y_stk_kron_nphot integer, --/D number of measurements used for y_stk_kron_flux (excluding outliers)
    y_wrp_psf_flux real, --/U Jy --/D mean y-band forced-warp PSF flux 
    y_wrp_psf_fluxerr real, --/U Jy --/D error on mean y-band forced-warp PSF flux 
    y_wrp_psf_nphot integer, --/D number of measurements used for y_wrp_psf_flux (excluding outliers)
    y_wrp_aper_flux real, --/U Jy --/D mean y-band forced-warp seeing-adapted aperture flux 
    y_wrp_aper_fluxerr real, --/U Jy --/D error on mean y-band forced-warp seeing-adapted aperture flux 
    y_wrp_aper_nphot integer, --/D number of measurements used for y_wrp_aper_flux (excluding outliers)
    y_wrp_kron_flux real, --/U Jy --/D mean y-band forced-warp Kron flux 
    y_wrp_kron_fluxerr real, --/U Jy --/D error on mean y-band forced-warp Kron flux 
    y_wrp_kron_nphot integer, --/D number of measurements used for y_wrp_kron_flux (excluding outliers)
    y_flags integer, --/D per-filter info flags (equiv. to StackObjectThin.yinfoFlag4)
    y_ncode integer, --/D number of chip detections in this filter (equiv. to StackObjectThin.ny)
    y_nwarp integer, --/D number of warp measurements in this filter (including primary & secondary skycells)
    y_nwarp_good integer, --/D number of warp measurements with psfqfperf > 0.85 in this filter (including primary & secondary skycells)
    y_nstack integer, --/D number of stack measurements (primary and secondary)
    y_nstack_det integer, --/D number of stack detections (S/N > 5, primary and secondary)
    y_psfqf real, --/D y-band PSF coverage factor
    y_psfqfperf real, --/D y-band PSF weighted fraction of pixels totally unmasked
    catid_objid bigint NOT NULL, --/D computed as (catid << 32) & objid. Equivalent to StackObjectThin.ippObjID
    extid_hi_lo bigint --/D computed as (extid_hi << 32) & extid_lo. Equivalent to StackObjectThin.ObjID
);


--
-- Name: dr18_sagitta; Type: TABLE; Schema: minidb; Owner: -
--

CREATE TABLE minidb.dr18_sagitta (
----------------------------------------------------------------------
--/H Catalog of pre-main-sequence stars derived from Gaia DR2 and 2MASS from McBride et al. (2021), their Table 4. For complete details, please see the original paper: https://iopscience.iop.org/article/10.3847/1538-3881/ac2432
----------------------------------------------------------------------
    source_id bigint NOT NULL, --/D Gaia DR2 unique identifier 
    ra double precision, --/U degrees --/D Right ascension 
    "dec" double precision, --/U degrees --/D Declination 
    av real, --/U mag --/D Predicted extinction 
    yso real, --/D Pre-main-sequence probability 
    yso_std real, --/D Error on pre-main-sequence probability 
    age real, --/U log yrs --/D Age 
    age_std real --/U log yrs --/D Error on age 
);


--
-- Name: dr18_sdss_apogeeallstarmerge_r13; Type: TABLE; Schema: minidb; Owner: -
--

CREATE TABLE minidb.dr18_sdss_apogeeallstarmerge_r13 (
    apogee_id text NOT NULL,
    nvisits smallint,
    nentries integer,
    ra double precision,
    "dec" double precision,
    glon double precision,
    glat double precision,
    pmra double precision,
    pmdec double precision,
    pm_src text,
    j real,
    j_err real,
    h real,
    h_err real,
    k real,
    k_err real,
    ak real,
    vhelio_avg real,
    vhelio_err real,
    vscatter real,
    sig_rvvar real,
    baseline real,
    mean_fiber real,
    sig_fiber real,
    apstar_ids text,
    visits text,
    fields text,
    surveys text,
    telescopes text,
    targflags text,
    starflags text,
    aspcapflags text,
    teff real,
    teff_err real,
    logg real,
    logg_err real,
    feh real,
    feh_err real,
    startype text,
    vjitter real,
    dist real,
    dist_err real,
    dist_src text,
    mstar real,
    mstar_err real,
    rstar real,
    rstar_err real,
    mstar_src text,
    designation text
);


--
-- Name: dr18_sdss_dr13_photoobj_primary; Type: TABLE; Schema: minidb; Owner: -
--

CREATE TABLE minidb.dr18_sdss_dr13_photoobj_primary (
----------------------------------------------------------------------
--/H Columns from the PhotoPrimary Table of SDSS DR13.
----------------------------------------------------------------------
    objid bigint NOT NULL, --/D Unique SDSS identifier composed from skyVersion,rerun,run,camcol,field,obj 
    ra double precision, --/U degrees --/D Right ascension 
    "dec" double precision --/U degrees --/D Declination 
);


--
-- Name: dr18_sdss_dr16_qso; Type: TABLE; Schema: minidb; Owner: -
--

CREATE TABLE minidb.dr18_sdss_dr16_qso (
    sdss_name text,
    ra double precision,
    "dec" double precision,
    plate integer,
    mjd integer,
    fiberid integer,
    autoclass_pqn text,
    autoclass_dr14q text,
    is_qso_qn integer,
    z_qn double precision,
    random_select integer,
    z_10k double precision,
    z_conf_10k integer,
    pipe_corr_10k integer,
    is_qso_10k integer,
    thing_id bigint,
    z_vi double precision,
    z_conf integer,
    class_person integer,
    z_dr12q double precision,
    is_qso_dr12q integer,
    z_dr7q_sch double precision,
    is_qso_dr7q integer,
    z_dr6q_hw double precision,
    z_dr7q_hw double precision,
    is_qso_final integer,
    z double precision,
    source_z text,
    z_pipe double precision,
    zwarning integer,
    objid text,
    z_pca double precision,
    zwarn_pca bigint,
    deltachi2_pca double precision,
    z_halpha double precision,
    zwarn_halpha bigint,
    deltachi2_halpha double precision,
    z_hbeta double precision,
    zwarn_hbeta bigint,
    deltachi2_hbeta double precision,
    z_mgii double precision,
    zwarn_mgii bigint,
    deltachi2_mgii double precision,
    z_ciii double precision,
    zwarn_ciii bigint,
    deltachi2_ciii double precision,
    z_civ double precision,
    zwarn_civ bigint,
    deltachi2_civ double precision,
    z_lya double precision,
    zwarn_lya bigint,
    deltachi2_lya double precision,
    z_lyawg real,
    z_dla text,
    nhi_dla text,
    conf_dla text,
    bal_prob real,
    bi_civ double precision,
    err_bi_civ double precision,
    ai_civ double precision,
    err_ai_civ double precision,
    bi_siiv double precision,
    err_bi_siiv double precision,
    ai_siiv double precision,
    err_ai_siiv double precision,
    boss_target1 bigint,
    eboss_target0 bigint,
    eboss_target1 bigint,
    eboss_target2 bigint,
    ancillary_target1 bigint,
    ancillary_target2 bigint,
    nspec_sdss integer,
    nspec_boss integer,
    nspec integer,
    plate_duplicate text,
    mjd_duplicate text,
    fiberid_duplicate text,
    spectro_duplicate text,
    skyversion integer,
    run_number integer,
    rerun_number text,
    camcol_number integer,
    field_number integer,
    id_number integer,
    lambda_eff double precision,
    zoffset double precision,
    xfocal double precision,
    yfocal double precision,
    chunk text,
    tile integer,
    platesn2 double precision,
    psfflux_u real,
    psfflux_g real,
    psfflux_r real,
    psfflux_i real,
    psfflux_z real,
    psfflux_ivar_u double precision,
    psfflux_ivar_g double precision,
    psfflux_ivar_r double precision,
    psfflux_ivar_i double precision,
    psfflux_ivar_z double precision,
    psfmag_u real,
    psfmag_g real,
    psfmag_r real,
    psfmag_i real,
    psfmag_z real,
    psfmagerr_u double precision,
    psfmagerr_g double precision,
    psfmagerr_r double precision,
    psfmagerr_i double precision,
    psfmagerr_z double precision,
    extinction_u real,
    extinction_g real,
    extinction_r real,
    extinction_i real,
    extinction_z real,
    m_i double precision,
    sn_median_all double precision,
    galex_matched integer,
    fuv double precision,
    fuv_ivar double precision,
    nuv double precision,
    nuv_ivar double precision,
    ukidss_matched integer,
    yflux double precision,
    yflux_err double precision,
    jflux double precision,
    jflux_err double precision,
    hflux double precision,
    hflux_err double precision,
    kflux double precision,
    kflux_err double precision,
    w1_flux real,
    w1_flux_ivar real,
    w1_mag real,
    w1_mag_err real,
    w1_chi2 real,
    w1_flux_snr real,
    w1_src_frac real,
    w1_ext_flux real,
    w1_ext_frac real,
    w1_npix integer,
    w2_flux real,
    w2_flux_ivar real,
    w2_mag real,
    w2_mag_err real,
    w2_chi2 real,
    w2_flux_snr real,
    w2_src_frac real,
    w2_ext_flux real,
    w2_ext_frac real,
    w2_npix integer,
    first_matched integer,
    first_flux double precision,
    first_snr double precision,
    sdss2first_sep double precision,
    jmag double precision,
    jmag_err double precision,
    jsnr double precision,
    jrdflag integer,
    hmag double precision,
    hmag_err double precision,
    hsnr double precision,
    hrdflag integer,
    kmag double precision,
    kmag_err double precision,
    ksnr double precision,
    krdflag integer,
    sdss2mass_sep double precision,
    rass2rxs_id text,
    rass2rxs_ra double precision,
    rass2rxs_dec double precision,
    rass2rxs_src_flux real,
    rass2rxs_src_flux_err real,
    sdss2rosat_sep double precision,
    xmm_src_id bigint,
    xmm_ra double precision,
    xmm_dec double precision,
    xmm_soft_flux real,
    xmm_soft_flux_err real,
    xmm_hard_flux real,
    xmm_hard_flux_err real,
    xmm_total_flux real,
    xmm_total_flux_err real,
    xmm_total_lum real,
    sdss2xmm_sep double precision,
    gaia_matched integer,
    gaia_designation text,
    gaia_ra double precision,
    gaia_dec double precision,
    gaia_parallax double precision,
    gaia_parallax_err double precision,
    gaia_pm_ra double precision,
    gaia_pm_ra_err double precision,
    gaia_pm_dec double precision,
    gaia_pm_dec_err double precision,
    gaia_g_mag double precision,
    gaia_g_flux_snr double precision,
    gaia_bp_mag double precision,
    gaia_bp_flux_snr double precision,
    gaia_rp_mag double precision,
    gaia_rp_flux_snr double precision,
    sdss2gaia_sep double precision,
    pk bigint NOT NULL
);


--
-- Name: dr18_sdss_dr16_qso_original; Type: TABLE; Schema: minidb; Owner: -
--

CREATE TABLE minidb.dr18_sdss_dr16_qso_original (
----------------------------------------------------------------------
--/H SDSS Data Release 16 Quasar Catalog (Lyke et al. 2020). For complete details, please see the original paper: https://iopscience.iop.org/article/10.3847/1538-4365/aba623
----------------------------------------------------------------------
    sdss_name text, --/D SDSS-DR16 designation (HHMMSS.ss+DDMMSS.s; J2000) 
    ra double precision, --/U degrees --/D Right ascension 
    "dec" double precision, --/U degrees --/D Declination 
    plate integer, --/D Spectroscopic plate number
    mjd integer, --/U day --/D Spectroscopic modified Julian date 
    fiberid integer, --/D Spectroscopic fiber number 
    autoclass_pqn text, --/D Object classification post-QuasarNet 
    autoclass_dr14q text, --/D Object classification based only on the DR14Q algorithm 
    is_qso_qn integer, --/D Binary flag for QuasarNET quasar identification 
    z_qn double precision, --/D Redshift derived by QuasarNET {}
    random_select integer, --/D Binary flag indicating objects selected for random visual inspection 
    z_10k double precision, --/D Redshift from visual inspectionn of random set 
    z_conf_10k integer, --/D Confidence rating for visual inspection redshift of random set 
    pipe_corr_10k integer, --/D Binary flag indicating if the automated pipeline classification and redshift were correct in the random set 
    is_qso_10k integer, --/D Binary flag for random set quasar identification 
    thing_id bigint, --/D SDSS identifier mainly for BOSS and eBOSS objects 
    z_vi double precision, --/D Redshift from visual inspection
    z_conf integer, --/D Confidence rating for visual inspection redshift 
    class_person integer, --/D Object classification from visual inspection 
    z_dr12q double precision, --/D Redshift taken from DR12Q visual inspection 
    is_qso_dr12q integer, --/D Flag indicating if an object was a quasar in DR12Q 
    z_dr7q_sch double precision, --/D Redshift taken from DR7Q catalog 
    is_qso_dr7q integer, --/D Flag indicating if an object was a quasar in DR7Q catalog 
    z_dr6q_hw double precision, --/D Redshift taken from DR6 catalog 
    z_dr7q_hw double precision, --/D Redshift taken from DR7 catalog 
    is_qso_final integer, --/D Flag indicating quasars included in final catalog 
    z double precision, --/D Best available redshift 
    source_z text, --/D Source for best available redshift 
    z_pipe double precision, --/D Redshift from SDSS pipeline version v5_13_0 
    zwarning integer, --/D Quality flag on SDSS pipeline redshift estimate 
    objid text, --/D SDSS object identification number (sky version, run, rerun, camera column, field number, and ID) 
    z_pca double precision, --/D PCA redshift derived by the redvsblue algorithm 
    zwarn_pca bigint, --/D Warning flag for redvsblue redshift 
    deltachi2_pca double precision, --/D Delta chi^2 for PCA redshift vs. cubic continuum fit 
    z_halpha double precision, --/D PCA line redshift for H-alpha from redvsblue 
    zwarn_halpha bigint, --/D Warning flag for H-alpha 
    deltachi2_halpha double precision, --/D Delta chi^2 for H-alpha line redshift vs. cubic continuum fit 
    z_hbeta double precision, --/D PCA line redshift for H-beta from redvsblue 
    zwarn_hbeta bigint, --/D Warning flag for H-beta 
    deltachi2_hbeta double precision, --/D Delta chi^2 for H-beta line redshift vs. cubic continuum fit 
    z_mgii double precision, --/D PCA line redshift for MgII from redvsblue 
    zwarn_mgii bigint, --/D Warning flag for MgII 
    deltachi2_mgii double precision, --/D Delta chi^2 for MgII line redshift vs. cubic continuum fit 
    z_ciii double precision, --/D PCA line redshift for CIII from redvsblue 
    zwarn_ciii bigint, --/D Warning flag for CIII 
    deltachi2_ciii double precision, --/D Delta chi^2 for CIII line redshift vs. cubic continuum fit 
    z_civ double precision, --/D PCA line redshift for CIV from redvsblue 
    zwarn_civ bigint, --/D Warning flag for CIV 
    deltachi2_civ double precision, --/D Delta chi^2 for CIV line redshift vs. cubic continuum fit 
    z_lya double precision, --/D PCA line redshift for Ly-alpha from redvsblue 
    zwarn_lya bigint, --/D Warning flag for Ly-alpha 
    deltachi2_lya double precision, --/D Delta chi^2 for Ly-alpha line redshift vs. cubic continuum fit 
    z_lyawg real, --/D PCA redshift derived from spectra masked blueward of Ly-alpha 
    z_dla text, --/D Redshift for damped Ly-alpha feature 
    nhi_dla text, --/U log g/cm^2 --/D Absorber column desnity for damped Ly-alpha feature 
    conf_dla text, --/D Confidence of detection for damped Lyα feature 
    bal_prob real, --/D BAL probability 
    bi_civ double precision, --/U km/s --/D BALnicity index for the CIV region 
    err_bi_civ double precision, --/U km/s --/D BI(CIV) uncertainty 
    ai_civ double precision, --/U km/s --/D Absorption index for the CIV region 
    err_ai_civ double precision, --/U km/s --/D AI(CIV) uncertainty 
    bi_siiv double precision, --/U km/s --/D BALnicity index for the SiIV region 
    err_bi_siiv double precision, --/U km/s --/D BI(SiIV) uncertainty 
    ai_siiv double precision, --/U km/s --/D Absorption index for the SiIV region 
    err_ai_siiv double precision, --/U km/s --/D AI(SiIV) uncertainty 
    boss_target1 bigint, --/D BOSS target selection flag for the main survey 
    eboss_target0 bigint, --/D eBOSS target selection flag for the pilot survey (SEQUELS) 
    eboss_target1 bigint, --/D eBOSS target selection flag for the main survey 
    eboss_target2 bigint, --/D eBOSS target 2 selection flag for the main survey 
    ancillary_target1 bigint, --/D BOSS target selection flag for the ancillary surveys 
    ancillary_target2 bigint, --/D BOSS target 2 selection flag for the ancillary surveys 
    nspec_sdss integer, --/D Number of additional spectra from SDSS-I/II 
    nspec_boss integer, --/D Number of additional spectra from BOSS/eBOSS 
    nspec integer, --/D Total number of additional spectra 
    plate_duplicate text, --/D Spectroscopic plate number for duplicate spectrum 
    mjd_duplicate text, --/D Spectroscopic MJD for duplicate spectrum 
    fiberid_duplicate text, --/D Spectroscopic ﬁber number for duplicate spectrum 
    spectro_duplicate text, --/D Spectroscopic epoch for each duplicate, 1=SDSS, 2=(e)BOSS 
    skyversion integer, --/D SDSS photometric sky version number 
    run_number integer, --/D SDSS imaging run number of photometric measurements 
    rerun_number text, --/D SDSS photometric processing rerun number 
    camcol_number integer, --/D DSS camera column number 
    field_number integer, --/D SDSS field number 
    id_number integer, --/D SDSS photometric ID 
    lambda_eff double precision, --/U Angstrom --/D Wavelength for which the fiber placement was optimized to account for atmospheric differential refraction 
    zoffset double precision, --/U micron --/D Backstopping offset distance 
    xfocal double precision, --/U mm --/D Hole x-axis position in focal plane 
    yfocal double precision, --/U mm --/D Hole y-axis position in focal plane 
    chunk text, --/D Name of tiling chunk (from the plate-list product 
    tile integer, --/D Tile number 
    platesn2 double precision, --/D Overall (S/N)^2 measure for plate, minimum of all four cameras 
    psfflux_u real, --/U nMgy --/D PSF flux in u-band (not corrected for Galactic extinction 
    psfflux_g real, --/U nMgy --/D PSF flux in g-band (not corrected for Galactic extinction 
    psfflux_r real, --/U nMgy --/D PSF flux in r-band (not corrected for Galactic extinction 
    psfflux_i real, --/U nMgy --/D PSF flux in i-band (not corrected for Galactic extinction 
    psfflux_z real, --/U nMgy --/D PSF flux in z-band (not corrected for Galactic extinction 
    psfflux_ivar_u double precision, --/U nMgy --/D Inverse variance of Fu 
    psfflux_ivar_g double precision, --/U nMgy --/D Inverse variance of Fg 
    psfflux_ivar_r double precision, --/U nMgy --/D Inverse variance of Fr 
    psfflux_ivar_i double precision, --/U nMgy --/D Inverse variance of Fi 
    psfflux_ivar_z double precision, --/U nMgy --/D Inverse variance of Fz 
    psfmag_u real, --/U mag --/D PSF u-band AB magnitude (not corrected for Galactic extinction) 
    psfmag_g real, --/U mag --/D PSF g-band AB magnitude (not corrected for Galactic extinction) 
    psfmag_r real, --/U mag --/D PSF r-band AB magnitude (not corrected for Galactic extinction) 
    psfmag_i real, --/U mag --/D PSF i-band AB magnitude (not corrected for Galactic extinction) 
    psfmag_z real, --/U mag --/D PSF z-band AB magnitude (not corrected for Galactic extinction) 
    psfmagerr_u double precision, --/U mag --/D Uncertainity in PSF u-band AB magnitude 
    psfmagerr_g double precision, --/U mag --/D Uncertainity in PSF g-band AB magnitude 
    psfmagerr_r double precision, --/U mag --/D Uncertainity in PSF r-band AB magnitude 
    psfmagerr_i double precision, --/U mag --/D Uncertainity in PSF i-band AB magnitude 
    psfmagerr_z double precision, --/U mag --/D Uncertainity in PSF z-band AB magnitude 
    extinction_u real, --/U mag --/D Galactic extinction in the u-band from Schlafly & Finkbeiner 
    extinction_g real, --/U mag --/D Galactic extinction in the g-band from Schlafly & Finkbeiner 
    extinction_r real, --/U mag --/D Galactic extinction in the r-band from Schlafly & Finkbeiner 
    extinction_i real, --/U mag --/D Galactic extinction in the i-band from Schlafly & Finkbeiner 
    extinction_z real, --/U mag --/D Galactic extinction in the z-band from Schlafly & Finkbeiner 
    m_i double precision, --/U z=2] using zPCA redshift, corrected for extinction [mag --/D Absolute i-band magnitude, Mi
    sn_median_all double precision, --/D S/N median value for all good pixels in the five bands 
    galex_matched integer, --/D GALEX matching flag 
    fuv double precision, --/U nMgy --/D FUV flux for GALEX 
    fuv_ivar double precision, --/U nMgy --/D Inverse variance of FUV 
    nuv double precision, --/U nMgy --/D NUV flux for GALEX 
    nuv_ivar double precision, --/U nMgy --/D Inverse variance of NUV 
    ukidss_matched integer, --/D UKIDSS DR8 matching flag 
    yflux double precision, --/U W/m^2/Hz --/D Y-band flux density from UKIDSS 
    yflux_err double precision, --/U W/m^2/Hz --/D Uncertainty in Y-band flux density 
    jflux double precision, --/U W/m^2/Hz --/D J-band flux density from UKIDSS 
    jflux_err double precision, --/U W/m^2/Hz --/D Uncertainty in J-band flux density 
    hflux double precision, --/U W/m^2/Hz --/D H-band flux density from UKIDSS 
    hflux_err double precision, --/U W/m^2/Hz --/D Uncertainty in H-band flux density 
    kflux double precision, --/U W/m^2/Hz --/D K-band flux density from UKIDSS 
    kflux_err double precision, --/U W/m^2/Hz --/D Uncertainty in K-band flux density 
    w1_flux real, --/U nMgy --/D WISE flux in the W1 band 
    w1_flux_ivar real, --/U nMgy --/D Inverse variance of flux in W1 
    w1_mag real, --/U mag --/D WISE W1-band magnitude 
    w1_mag_err real, --/U mag --/D W1mag uncertainty 
    w1_chi2 real, --/D Profile-weighted chi^2 for the W1 band 
    w1_flux_snr real, --/D S/N for the W1 band from the flux and inverse variance 
    w1_src_frac real, --/D Fraction of source in profile-weighted fit 
    w1_ext_flux real, --/D Amount of flux added to the profile by nearby sources 
    w1_ext_frac real, --/D Fraction of the profile flux from nearby sources 
    w1_npix integer, --/D Number of pixels included in the profile fit 
    w2_flux real, --/U nMgy --/D WISE flux in the W1 band 
    w2_flux_ivar real, --/U nMgy --/D Inverse variance of flux in W1 
    w2_mag real, --/U mag --/D WISE W1-band magnitude 
    w2_mag_err real, --/U mag --/D W1mag uncertainty 
    w2_chi2 real, --/D Profile-weighted chi^2 for the W1 band 
    w2_flux_snr real, --/D S/N for the W1 band from the flux and inverse variance 
    w2_src_frac real, --/D Fraction of source in profile-weighted fit 
    w2_ext_flux real, --/D Amount of flux added to the profile by nearby sources 
    w2_ext_frac real, --/D Fraction of the profile flux from nearby sources 
    w2_npix integer, --/D Number of pixels included in the profile fit 
    first_matched integer, --/D Matching flag for FIRST 
    first_flux double precision, --/U mJy --/D FIRST peak flux density at 20cm 
    first_snr double precision, --/D FIRST flux density S/N 
    sdss2first_sep double precision, --/U arcsec --/D SDSS-FIRST separation 
    jmag double precision, --/U mag --/D 2MASS (Vega) J-band magnitude 
    jmag_err double precision, --/U mag --/D Uncertainity in J-band magnitude 
    jsnr double precision, --/D 2MASS J-band S/N 
    jrdflag integer, --/D J-band photometry flag 
    hmag double precision, --/U mag --/D 2MASS (Vega) J-band magnitude 
    hmag_err double precision, --/U mag --/D Uncertainity in H-band magnitude 
    hsnr double precision, --/D 2MASS H-band S/N 
    hrdflag integer, --/D H-band photometry flag 
    kmag double precision, --/U mag --/D 2MASS (Vega) J-band magnitude 
    kmag_err double precision, --/U mag --/D Uncertainity in K-band magnitude 
    ksnr double precision, --/D 2MASS K-band S/N 
    krdflag integer, --/D K-band photometry flag 
    sdss2mass_sep double precision, --/U arcsec --/D SDSS-2MASS separation 
    rass2rxs_id text, --/D 2nd ROSAT identifier 
    rass2rxs_ra double precision, --/U degrees --/D Right ascension of the ROSAT source 
    rass2rxs_dec double precision, --/U degrees --/D Declination of the ROSAT source 
    rass2rxs_src_flux real, --/U erg/s/cm^2 --/D ROSAT source flux in the 0.5-2.0keV band 
    rass2rxs_src_flux_err real, --/U erg/s/cm^2 --/D Uncertainty in flux in the 0.5-2.0keV band 
    sdss2rosat_sep double precision, --/U arcsec --/D SDSS-ROSAT separation 
    xmm_src_id bigint, --/D XMM source number 
    xmm_ra double precision, --/U degrees --/D XMM right ascension 
    xmm_dec double precision, --/U degrees --/D XMM declination 
    xmm_soft_flux real, --/U erg/s/cm^2 --/D XMM soft (0.2-2.0keV) X-ray flux 
    xmm_soft_flux_err real, --/U erg/s/cm^2 --/D Uncertainty in flux in the 0.2-2.0keV band 
    xmm_hard_flux real, --/U erg/s/cm^2 --/D XMM hard (2.0-12.0keV) X-ray flux 
    xmm_hard_flux_err real, --/U erg/s/cm^2 --/D Uncertainty in flux in the 2.0-12.0 keV band
    xmm_total_flux real, --/U erg/s/cm^2 --/D XMM total (0.2-12.0keV) X-ray flux 
    xmm_total_flux_err real, --/U erg/s/cm^2 --/D Uncertainty in flux in the 0.2-12.0keV band 
    xmm_total_lum real, --/U erg/s --/D Total (0.2–12.0 keV) X-ray luminosity 
    sdss2xmm_sep double precision, --/U arcsec --/D SDSS-XMM-Newton separation 
    gaia_matched integer, --/D Gaia matching flag 
    gaia_designation text, --/D Gaia DR2 identifier 
    gaia_ra double precision, --/U degrees --/D Gaia DR2 barycentric right ascension 
    gaia_dec double precision, --/U degrees --/D Gaia DR2 barycentric declination 
    gaia_parallax double precision, --/U mas --/D Gaia DR2 absolute stellar parallax 
    gaia_parallax_err double precision, --/U mas --/D Gaia DR2 parallax uncertainty 
    gaia_pm_ra double precision, --/U mas/yr --/D Gaia DR2 proper motion in RA 
    gaia_pm_ra_err double precision, --/U mas/yr --/D Uncertainty in Gaia DR2 proper motion in RA 
    gaia_pm_dec double precision, --/U mas/yr --/D Gaia DR2 proper motion in Declination 
    gaia_pm_dec_err double precision, --/U mas/yr --/D Uncertainty in Gaia DR2 proper motion in Declination 
    gaia_g_mag double precision, --/U mag --/D Gaia DR2 mean magnitude in the G band 
    gaia_g_flux_snr double precision, --/D Mean flux over the standard deviation in the G band 
    gaia_bp_mag double precision, --/U mag --/D Gaia DR2 mean magnitude in the BP band 
    gaia_bp_flux_snr double precision, --/D Mean flux over the standard deviation in the BP band 
    gaia_rp_mag double precision, --/U mag --/D DR2 mean magnitude in the RP band 
    gaia_rp_flux_snr double precision, --/D Mean flux over the standard deviation in the RP band 
    sdss2gaia_sep double precision, --/U arcsec --/D SDSS-Gaia separation 
    pk bigint --/D Primary key 
);


--
-- Name: dr18_sdss_dr16_specobj; Type: TABLE; Schema: minidb; Owner: -
--

CREATE TABLE minidb.dr18_sdss_dr16_specobj (
----------------------------------------------------------------------
--/H This is a base table containing ALL the spectroscopic information, including a lot of duplicate and bad data. Use the SpecObj view instead, which has the data properly filtered for cleanliness. These tables contain both the BOSS and SDSS spectrograph data. NOTE: The RA and Dec in this table refer to the DR8 coordinates, which have errors in the region north of 41 deg in Dec. This change does not affect the matching to the photometric catalog.
----------------------------------------------------------------------
    specobjid numeric(20,0) NOT NULL, --/D Unique database ID based on PLATE, MJD, FIBERID, RUN2D
    bestobjid bigint, --/D Object ID of photoObj match (position-based)
    fluxobjid bigint, --/D Object ID of photoObj match (flux-based)
    targetobjid bigint, --/D Object ID of original target
    plateid numeric(20,0), --/D Database ID of Plate
    scienceprimary smallint, --/D Best version of spectrum at this location (defines default view SpecObj)
    sdssprimary smallint, --/D Best version of spectrum at this location among SDSS plates (defines default view SpecObj)
    legacyprimary smallint, --/D Best version of spectrum at this location, among Legacy plates
    segueprimary smallint, --/D Best version of spectrum at this location, among SEGUE plates
    segue1primary smallint, --/D Best version of spectrum at this location, among SEGUE-1 plates
    segue2primary smallint, --/D Best version of spectrum at this location, among SEGUE-2 plates
    bossprimary smallint, --/D Best version of spectrum at this location, among BOSS plates
    bossspecobjid integer, --/D Index of BOSS observation in spAll flat file
    firstrelease character varying(32), --/D Name of first release this object was associated with
    survey character varying(32), --/D Survey name
    instrument character varying(32), --/D Instrument used (SDSS or BOSS spectrograph)
    programname character varying(32), --/D Program name
    chunk character varying(32), --/D Chunk name
    platerun character varying(32), --/D Plate drill run name
    mjd integer, --/D MJD of observation
    plate smallint, --/D Plate number
    fiberid smallint, --/D Fiber ID
    run1d character varying(32), --/D 1D Reduction version of spectrum
    run2d character varying(32), --/D 2D Reduction version of spectrum
    tile integer, --/D Tile number
    designid integer, --/D Design ID number
    legacy_target1 bigint, --/D for Legacy program, target selection information at plate design
    legacy_target2 bigint, --/D for Legacy program target selection information at plate design, secondary/qa/calibration
    special_target1 bigint, --/D for Special program target selection information at plate design
    special_target2 bigint, --/D for Special program target selection information at plate design, secondary/qa/calibration
    segue1_target1 bigint, --/D SEGUE-1 target selection information at plate design, primary science selection
    segue1_target2 bigint, --/D SEGUE-1 target selection information at plate design, secondary/qa/calib selection
    segue2_target1 bigint, --/D SEGUE-2 target selection information at plate design, primary science selection
    segue2_target2 bigint, --/D SEGUE-2 target selection information at plate design, secondary/qa/calib selection
    boss_target1 bigint, --/D BOSS target selection information at plate
    eboss_target0 bigint, --/D EBOSS target selection information, for SEQUELS plates
    eboss_target1 bigint, --/D EBOSS target selection information, for eBOSS plates
    eboss_target2 bigint, --/D EBOSS target selection information, for TDSS, SPIDERS, ELG, etc. plates
    eboss_target_id bigint, --/D EBOSS unique target identifier for every spectroscopic target,
    ancillary_target1 bigint, --/D BOSS ancillary science target selection information at plate design
    ancillary_target2 bigint, --/D BOSS ancillary target selection information at plate design
    thing_id_targeting bigint, --/D thing_id value from the version of resolve from which the targeting was created
    thing_id integer, --/D Unique identifier from global resolve
    primtarget bigint, --/D target selection information at plate design, primary science selection (for backwards compatibility)
    sectarget bigint, --/D target selection information at plate design, secondary/qa/calib selection (for backwards compatibility)
    spectrographid smallint, --/D which spectrograph (1,2)
    sourcetype character varying(128), --/D For Legacy, SEGUE-2 and BOSS science targets, type of object targeted as (target bits contain full information and are recommended)
    targettype character varying(128), --/D Nature of target: SCIENCE, STANDARD, or SKY
    ra double precision, --/D DR8 Right ascension of fiber, J2000
    "dec" double precision, --/D DR8 Declination of fiber, J2000
    cx double precision, --/D x of Normal unit vector in J2000
    cy double precision, --/D y of Normal unit vector in J2000
    cz double precision, --/D z of Normal unit vector in J2000
    xfocal real, --/D X focal plane position (+RA direction)
    yfocal real, --/D Y focal plane position (+Dec direction)
    lambdaeff real, --/D Effective wavelength that hole was drilled for (accounting for atmopheric refraction)
    bluefiber integer, --/D Set to 1 if this hole was designated a "blue fiber", 0 if designated a "red fiber" (high redshift LRGs are preferentially in "red fibers")
    zoffset real, --/D Washer thickness used (for backstopping BOSS quasar targets, so they are closer to 4000 Angstrom focal plan)
    z real, --/D Final Redshift
    zerr real, --/D Redshift error
    zwarning integer, --/D Bitmask of warning values; 0 means all is well
    class character varying(32), --/D Spectroscopic class (GALAXY, QSO, or STAR)
    subclass character varying(32), --/D Spectroscopic subclass
    rchi2 real, --/D Reduced chi-squared of best fit
    dof real, --/D Degrees of freedom in best fit
    rchi2diff real, --/D Difference in reduced chi-squared between best and second best fit
    z_noqso real, --/D Best redshift when excluding QSO fit in BOSS spectra (right redshift to use for galaxy targets)
    zerr_noqso real, --/D Error in "z_noqso" redshift (BOSS spectra only)
    zwarning_noqso integer, --/D Warnings in "z_noqso" redshift (BOSS spectra only)
    class_noqso character varying(32), --/D Classification in "z_noqso" redshift
    subclass_noqso character varying(32), --/D Sub-classification in "z_noqso" redshift
    rchi2diff_noqso real, --/D Reduced chi-squared difference from next best redshift, for "z_noqso" redshift
    z_person real, --/D Person-assigned redshift, if this object has been inspected
    class_person character varying(32), --/D Person-assigned classification, if this object has been inspected
    comments_person character varying(200), --/D Comments from person for inspected objects
    tfile character varying(32), --/D File name of best fit template source
    tcolumn_0 smallint, --/D Which column of the template file corresponds to template #0
    tcolumn_1 smallint, --/D Which column of the template file corresponds to template #1
    tcolumn_2 smallint, --/D Which column of the template file corresponds to template #2
    tcolumn_3 smallint, --/D Which column of the template file corresponds to template #3
    tcolumn_4 smallint, --/D Which column of the template file corresponds to template #4
    tcolumn_5 smallint, --/D Which column of the template file corresponds to template #5
    tcolumn_6 smallint, --/D Which column of the template file corresponds to template #6
    tcolumn_7 smallint, --/D Which column of the template file corresponds to template #7
    tcolumn_8 smallint, --/D Which column of the template file corresponds to template #8
    tcolumn_9 smallint, --/D Which column of the template file corresponds to template #9
    npoly real, --/D Number of polynomial terms used in the fit
    theta_0 real, --/D Coefficient for template #0 of fit
    theta_1 real, --/D Coefficient for template #1 of fit
    theta_2 real, --/D Coefficient for template #2 of fit
    theta_3 real, --/D Coefficient for template #3 of fit
    theta_4 real, --/D Coefficient for template #4 of fit
    theta_5 real, --/D Coefficient for template #5 of fit
    theta_6 real, --/D Coefficient for template #6 of fit
    theta_7 real, --/D Coefficient for template #7 of fit
    theta_8 real, --/D Coefficient for template #8 of fit
    theta_9 real, --/D Coefficient for template #9 of fit
    veldisp real, --/D Velocity dispersion
    veldisperr real, --/D Error in velocity dispersion
    veldispz real, --/D Redshift associated with best fit velocity dispersion
    veldispzerr real, --/D Error in redshift associated with best fit velocity dispersion
    veldispchi2 real, --/D Chi-squared associated with velocity dispersion fit
    veldispnpix integer, --/D Number of pixels overlapping best template in velocity dispersion fit
    veldispdof integer, --/D Number of degrees of freedom in velocity dispersion fit
    wavemin real, --/D Minimum observed (vacuum) wavelength
    wavemax real, --/D Maximum observed (vacuum) wavelength
    wcoverage real, --/D Coverage in wavelength, in units of log10 wavelength
    snmedian_u real, --/D Median signal-to-noise over all good pixels in u-band
    snmedian_g real, --/D Median signal-to-noise over all good pixels in g-band
    snmedian_r real, --/D Median signal-to-noise over all good pixels in r-band
    snmedian_i real, --/D Median signal-to-noise over all good pixels in i-band
    snmedian_z real, --/D Median signal-to-noise over all good pixels in z-band
    snmedian real, --/D Median signal-to-noise over all good pixels
    chi68p real, --/D 68-th percentile value of abs(chi) of the best-fit synthetic spectrum to the actual spectrum (around 1.0 for a good fit)
    fracnsigma_1 real, --/D Fraction of pixels deviant by more than 1 sigma relative to best-fit
    fracnsigma_2 real, --/D Fraction of pixels deviant by more than 2 sigma relative to best-fit
    fracnsigma_3 real, --/D Fraction of pixels deviant by more than 3 sigma relative to best-fit
    fracnsigma_4 real, --/D Fraction of pixels deviant by more than 4 sigma relative to best-fit
    fracnsigma_5 real, --/D Fraction of pixels deviant by more than 5 sigma relative to best-fit
    fracnsigma_6 real, --/D Fraction of pixels deviant by more than 6 sigma relative to best-fit
    fracnsigma_7 real, --/D Fraction of pixels deviant by more than 7 sigma relative to best-fit
    fracnsigma_8 real, --/D Fraction of pixels deviant by more than 8 sigma relative to best-fit
    fracnsigma_9 real, --/D Fraction of pixels deviant by more than 9 sigma relative to best-fit
    fracnsigma_10 real, --/D Fraction of pixels deviant by more than 10 sigma relative to best-fit
    fracnsighi_1 real, --/D Fraction of pixels high by more than 1 sigma relative to best-fit
    fracnsighi_2 real, --/D Fraction of pixels high by more than 2 sigma relative to best-fit
    fracnsighi_3 real, --/D Fraction of pixels high by more than 3 sigma relative to best-fit
    fracnsighi_4 real, --/D Fraction of pixels high by more than 4 sigma relative to best-fit
    fracnsighi_5 real, --/D Fraction of pixels high by more than 5 sigma relative to best-fit
    fracnsighi_6 real, --/D Fraction of pixels high by more than 6 sigma relative to best-fit
    fracnsighi_7 real, --/D Fraction of pixels high by more than 7 sigma relative to best-fit
    fracnsighi_8 real, --/D Fraction of pixels high by more than 8 sigma relative to best-fit
    fracnsighi_9 real, --/D Fraction of pixels high by more than 9 sigma relative to best-fit
    fracnsighi_10 real, --/D Fraction of pixels high by more than 10 sigma relative to best-fit
    fracnsiglo_1 real, --/D Fraction of pixels low by more than 1 sigma relative to best-fit
    fracnsiglo_2 real, --/D Fraction of pixels low by more than 2 sigma relative to best-fit
    fracnsiglo_3 real, --/D Fraction of pixels low by more than 3 sigma relative to best-fit
    fracnsiglo_4 real, --/D Fraction of pixels low by more than 4 sigma relative to best-fit
    fracnsiglo_5 real, --/D Fraction of pixels low by more than 5 sigma relative to best-fit
    fracnsiglo_6 real, --/D Fraction of pixels low by more than 6 sigma relative to best-fit
    fracnsiglo_7 real, --/D Fraction of pixels low by more than 7 sigma relative to best-fit
    fracnsiglo_8 real, --/D Fraction of pixels low by more than 8 sigma relative to best-fit
    fracnsiglo_9 real, --/D Fraction of pixels low by more than 9 sigma relative to best-fit
    fracnsiglo_10 real, --/D Fraction of pixels low by more than 10 sigma relative to best-fit
    spectroflux_u real, --/D Spectrum projected onto u filter
    spectroflux_g real, --/D Spectrum projected onto g filter
    spectroflux_r real, --/D Spectrum projected onto r filter
    spectroflux_i real, --/D Spectrum projected onto i filter
    spectroflux_z real, --/D Spectrum projected onto z filter
    spectrosynflux_u real, --/D Best-fit template spectrum projected onto u filter
    spectrosynflux_g real, --/D Best-fit template spectrum projected onto g filter
    spectrosynflux_r real, --/D Best-fit template spectrum projected onto r filter
    spectrosynflux_i real, --/D Best-fit template spectrum projected onto i filter
    spectrosynflux_z real, --/D Best-fit template spectrum projected onto z filter
    spectrofluxivar_u real, --/D Inverse variance of spectrum projected onto u filter
    spectrofluxivar_g real, --/D Inverse variance of spectrum projected onto g filter
    spectrofluxivar_r real, --/D Inverse variance of spectrum projected onto r filter
    spectrofluxivar_i real, --/D Inverse variance of spectrum projected onto i filter
    spectrofluxivar_z real, --/D Inverse variance of spectrum projected onto z filter
    spectrosynfluxivar_u real, --/D Inverse variance of best-fit template spectrum projected onto u filter
    spectrosynfluxivar_g real, --/D Inverse variance of best-fit template spectrum projected onto g filter
    spectrosynfluxivar_r real, --/D Inverse variance of best-fit template spectrum projected onto r filter
    spectrosynfluxivar_i real, --/D Inverse variance of best-fit template spectrum projected onto i filter
    spectrosynfluxivar_z real, --/D Inverse variance of best-fit template spectrum projected onto z filter
    spectroskyflux_u real, --/D Sky spectrum projected onto u filter
    spectroskyflux_g real, --/D Sky spectrum projected onto g filter
    spectroskyflux_r real, --/D Sky spectrum projected onto r filter
    spectroskyflux_i real, --/D Sky spectrum projected onto i filter
    spectroskyflux_z real, --/D Sky spectrum projected onto z filter
    anyandmask integer, --/D For each bit, records whether any pixel in the spectrum has that bit set in its ANDMASK
    anyormask integer, --/D For each bit, records whether any pixel in the spectrum has that bit set in its ORMASK
    platesn2 real, --/D Overall signal-to-noise-squared measure for plate (only set for SDSS spectrograph)
    deredsn2 real, --/D Dereddened signal-to-noise-squared measure for plate (only set for BOSS spectrograph)
    snturnoff real, --/D Signal to noise measure for MS turnoff stars on plate (-9999 if not appropriate)
    sn1_g real, --/D (S/N)^2 at g=20.20 for spectrograph #1
    sn1_r real, --/D (S/N)^2 at r=20.25 for spectrograph #1
    sn1_i real, --/D (S/N)^2 at i=19.90 for spectrograph #1
    sn2_g real, --/D (S/N)^2 at g=20.20 for spectrograph #2
    sn2_r real, --/D (S/N)^2 at r=20.25 for spectrograph #2
    sn2_i real, --/D (S/N)^2 at i=19.90 for spectrograph #2
    elodiefilename character varying(32), --/D File name for best-fit Elodie star
    elodieobject character varying(32), --/D Star name (mostly Henry Draper names)
    elodiesptype character varying(32), --/D Spectral type
    elodiebv real, --/D (B-V) color
    elodieteff real, --/D Effective temperature
    elodielogg real, --/D log10(gravity)
    elodiefeh real, --/U Fe/H --/D Metallicity (
    elodiez real, --/D Redshift
    elodiezerr real, --/D Redshift error (negative for invalid fit)
    elodiezmodelerr real, --/D Standard deviation in redshift among the 12 best-fit stars
    elodierchi2 real, --/D Reduced chi^2
    elodiedof real, --/D Degrees of freedom for fit
    htmid bigint, --/D 20 deep Hierarchical Triangular Mesh ID
    loadversion integer --/D Load Version
);


--
-- Name: dr18_skies_v2; Type: TABLE; Schema: minidb; Owner: -
--

CREATE TABLE minidb.dr18_skies_v2 (
----------------------------------------------------------------------
--/H This table stores the positions used as blank sky regions for DR18 targetting. The sky regions are selected by dividing the sky in tiles of HEALpix nside 32. Each tile is then subdivided in candidate regions of HEALpix nside 32768 and the pixels that meet the isolation requirements are considered valid skies. This process is repeated for a number of all-sky catalogues. See <a href="https://sdss.org/dr18/targeting/fps/"> for further details on skies target selection.
----------------------------------------------------------------------
    pix_32768 bigint NOT NULL, --/D The HEALpix pixel (nside=32768) of the sky region.
    ra double precision, --/D The RA of the centre of the sky pixel.
    "dec" double precision, --/D The declination of the centre of the sky pixel.
    down_pix bigint, --/D The HEALpix pixel (nside=256) of the sky region. Used internally to downsample the list of candidate region.
    tile_32 bigint, --/D The HEALpix pixel (nside=32) of the sky region.
    valid_gaia boolean, --/D Whether this is a valid sky region in the Gaia catalogue.
    selected_gaia boolean, --/D Whether this sky region was selected in the Gaia catalogue.
    sep_neighbour_gaia real, --/U arcsec --/D Separation to the nearest neighbour 
    mag_neighbour_gaia real, --/D Magnitude of the nearest neighbour (G band).
    valid_ls8 boolean, --/D Whether this is a valid sky region in the Legacy Survey DR18 catalogue.
    selected_ls8 boolean, --/D Whether this sky region was selected in the Legacy Survey DR18 catalogue.
    sep_neighbour_ls8 real, --/U arcsec --/D Separation to the nearest neighbour 
    mag_neighbour_ls8 real, --/D Magnitude of the nearest neighbour (r-band).
    valid_ps1dr2 boolean, --/D Whether this is a valid sky region in the PanSTARRS DR2 catalogue.
    selected_ps1dr2 boolean, --/D Whether this sky region was selected in the PanSTARRS DR2 catalogue.
    sep_neighbour_ps1dr2 real, --/U arcsec --/D Separation to the nearest neighbour 
    mag_neighbour_ps1dr2 real, --/D Magnitude of the nearest neighbour (r-band).
    valid_tmass boolean, --/D Whether this is a valid sky region in the 2MASS point source catalogue.
    selected_tmass boolean, --/D Whether this sky region was selected in the 2MASS point source catalogue.
    sep_neighbour_tmass real, --/U arcsec --/D Separation to the nearest neighbour 
    mag_neighbour_tmass real, --/D Magnitude of the nearest neighbour (H band).
    valid_tycho2 boolean, --/D Whether this is a valid sky region in the Tycho2 catalogue.
    selected_tycho2 boolean, --/D Whether this sky region was selected in the Tycho2 catalogue.
    sep_neighbour_tycho2 real, --/U arcsec --/D Separation to the nearest neighbour 
    mag_neighbour_tycho2 real, --/D Magnitude of the nearest neighbour (Vt band).
    valid_tmass_xsc boolean, --/D Whether this is a valid sky region in the 2MASS extended source catalogue.
    selected_tmass_xsc boolean, --/D Whether this sky region was selected in the 2MASS extended source catalogue.
    sep_neighbour_tmass_xsc real --/U arcsec --/D Separation to the nearest neighbour 
);


--
-- Name: dr18_skymapper_dr2; Type: TABLE; Schema: minidb; Owner: -
--

CREATE TABLE minidb.dr18_skymapper_dr2 (
    object_id bigint NOT NULL,
    raj2000 double precision,
    dej2000 double precision,
    e_raj2000 integer,
    e_dej2000 integer,
    smss_j character(18),
    mean_epoch double precision,
    rms_epoch real,
    glon real,
    glat real,
    flags smallint,
    nimaflags integer,
    ngood smallint,
    ngood_min smallint,
    nch_max smallint,
    density real,
    u_flags smallint,
    u_nimaflags integer,
    u_ngood smallint,
    u_nch smallint,
    u_nclip smallint,
    v_flags smallint,
    v_nimaflags integer,
    v_ngood smallint,
    v_nch smallint,
    v_nclip smallint,
    g_flags smallint,
    g_nimaflags integer,
    g_ngood smallint,
    g_nch smallint,
    g_nclip smallint,
    r_flags smallint,
    r_nimaflags integer,
    r_ngood smallint,
    r_nch smallint,
    r_nclip smallint,
    i_flags smallint,
    i_nimaflags integer,
    i_ngood smallint,
    i_nch smallint,
    i_nclip smallint,
    z_flags smallint,
    z_nimaflags integer,
    z_ngood smallint,
    z_nch smallint,
    z_nclip smallint,
    class_star real,
    flags_psf integer,
    radius_petro real,
    u_psf real,
    e_u_psf real,
    u_rchi2var real,
    u_petro real,
    e_u_petro real,
    v_psf real,
    e_v_psf real,
    v_rchi2var real,
    v_petro real,
    e_v_petro real,
    g_psf real,
    e_g_psf real,
    g_rchi2var real,
    g_petro real,
    e_g_petro real,
    r_psf real,
    e_r_psf real,
    r_rchi2var real,
    r_petro real,
    e_r_petro real,
    i_psf real,
    e_i_psf real,
    i_rchi2var real,
    i_petro real,
    e_i_petro real,
    z_psf real,
    e_z_psf real,
    z_rchi2var real,
    z_petro real,
    e_z_petro real,
    ebmv_sfd real,
    prox real,
    prox_id bigint,
    dr1_id bigint,
    dr1_dist real,
    twomass_key bigint,
    twomass_dist real,
    allwise_cntr bigint,
    allwise_dist real,
    ucac4_mpos bigint,
    ucac4_dist real,
    refcat2_id bigint,
    refcat2_dist real,
    ps1_dr1_id bigint,
    ps1_dr1_dist real,
    galex_guv_id bigint,
    galex_guv_dist real,
    gaia_dr2_id1 bigint,
    gaia_dr2_dist1 real,
    gaia_dr2_id2 bigint,
    gaia_dr2_dist2 real
);


--
-- Name: dr18_supercosmos; Type: TABLE; Schema: minidb; Owner: -
--

CREATE TABLE minidb.dr18_supercosmos (
    objid bigint NOT NULL,
    objidb bigint,
    objidr1 bigint,
    objidr2 bigint,
    objidi bigint,
    htmid bigint,
    epoch real,
    ra double precision,
    "dec" double precision,
    sigra double precision,
    sigdec double precision,
    cx double precision,
    cy double precision,
    cz double precision,
    muacosd real,
    mud real,
    sigmuacosd real,
    sigmud real,
    chi2 real,
    nplates smallint,
    classmagb real,
    classmagr1 real,
    classmagr2 real,
    classmagi real,
    gcormagb real,
    gcormagr1 real,
    gcormagr2 real,
    gcormagi real,
    scormagb real,
    scormagr1 real,
    scormagr2 real,
    scormagi real,
    meanclass smallint,
    classb smallint,
    classr1 smallint,
    classr2 smallint,
    classi smallint,
    ellipb real,
    ellipr1 real,
    ellipr2 real,
    ellipi real,
    qualb integer,
    qualr1 integer,
    qualr2 integer,
    quali integer,
    blendb integer,
    blendr1 integer,
    blendr2 integer,
    blendi integer,
    prfstatb real,
    prfstatr1 real,
    prfstatr2 real,
    prfstati real,
    l real,
    b real,
    d real,
    ebmv real
);


--
-- Name: dr18_target; Type: TABLE; Schema: minidb; Owner: -
--

CREATE TABLE minidb.dr18_target (
----------------------------------------------------------------------
--/H This table stores the targets associated with DR18 target selection cartons. Note that the targets in this table are unique, but a target can be associated with multiple cartons. That many-to-many relationship is encoded in the dr18_carton_to_target table.
----------------------------------------------------------------------
    target_pk bigint NOT NULL, --/D The primary key. A sequential identifier. 
    ra double precision, --/U degree --/D The right ascension of the target in ICRS coordinates at epoch. From dr18_catalog. 
    "dec" double precision, --/U degree --/D The declination of the target in ICRS coordinates at epoch. From dr18_catalog. 
    pmra real, --/U mas/yr --/D The proper motion in right ascenscion of the target, as a true angle. From dr18_catalog. 
    pmdec real, --/U mas/yr --/D The proper motion in declination of the target. From dr18_catalog. 
    epoch real, --/U years --/D The epoch of the coordinates, as a Julian epoch. 
    parallax real, --/U arcsec --/D The parallax of the target. From dr18_catalog. 
    catalogid bigint --/D The catalogid of the entry in dr18_catalog associated with this target. 
);


--
-- Name: dr18_targetdb_version; Type: TABLE; Schema: minidb; Owner: -
--

CREATE TABLE minidb.dr18_targetdb_version (
    pk integer NOT NULL,
    plan text,
    tag text,
    target_selection boolean,
    robostrategy boolean
);


--
-- Name: dr18_targeting_generation; Type: TABLE; Schema: minidb; Owner: -
--

CREATE TABLE minidb.dr18_targeting_generation (
    pk integer NOT NULL,
    label text
);


--
-- Name: dr18_targeting_generation_pk_seq; Type: SEQUENCE; Schema: minidb; Owner: -
--

CREATE SEQUENCE minidb.dr18_targeting_generation_pk_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dr18_targeting_generation_pk_seq; Type: SEQUENCE OWNED BY; Schema: minidb; Owner: -
--

ALTER SEQUENCE minidb.dr18_targeting_generation_pk_seq OWNED BY minidb.dr18_targeting_generation.pk;


--
-- Name: dr18_tic_v8; Type: TABLE; Schema: minidb; Owner: -
--

CREATE TABLE minidb.dr18_tic_v8 (
----------------------------------------------------------------------
--/H The Eight version of the TESS Input Catalogue (<a href="https://outerspace.stsci.edu/display/TESS/TIC+v8+and+CTL+v8.xx+Data+Release+Notes"></a>). This catalogue is used in v0.5 target selection as a form of internal cross-match between the objects found in difference input catalogues.
----------------------------------------------------------------------
    id bigint NOT NULL, --/D TESS Input Catalog identifier
    version character varying(8), --/D Version Identifier for this entry
    hip integer, --/D Hipparcos Identifier
    tyc character varying(12), --/D Tycho2 Identifier
    ucac character varying(10), --/D UCAC4 Identifier
    twomass character varying(20), --/D 2MASS Identifier
    sdss bigint, --/D SDSS DR9 Identifier
    allwise character varying(20), --/D ALLWISE Identifier
    gaia character varying(20), --/D GAIA Identifier
    apass character varying(30), --/D APASS Identifier
    kic integer, --/D KIC Identifier
    objtype character varying(16), --/D Object Type
    typesrc character varying(16), --/D Source of the object
    ra double precision, --/D Right Ascension epoch 2000
    "dec" double precision, --/D Declination epoch 2000
    posflag character varying(12), --/D Source of the position
    pmra real, --/D Proper Motion in Right Ascension
    e_pmra real, --/D Uncertainty in PM Right Ascension
    pmdec real, --/D Proper Motion in Declination
    e_pmdec real, --/D Uncertainty in PM Declination
    pmflag character varying(12), --/D Source of the Proper Motion
    plx real, --/D Parallax
    e_plx real, --/D Error in the parallax
    parflag character varying(12), --/D Source of the parallax
    gallong double precision, --/D Galactic Longitude
    gallat double precision, --/D Galactic Latitude
    eclong double precision, --/D Ecliptic Longitude
    eclat double precision, --/D Ecliptic Latitude
    bmag real, --/D Johnson B
    e_bmag real, --/D Uncertainty in Johnson B
    vmag real, --/D Johnson V
    e_vmag real, --/D Uncertainty in Johnson V
    umag real, --/D Sloan u
    e_umag real, --/D Uncertainty in Sloan u
    gmag real, --/D Sloan g
    e_gmag real, --/D Uncertainty in Sloan g
    rmag real, --/D Sloan r
    e_rmag real, --/D Uncertainty in Sloan r
    imag real, --/D Sloan I
    e_imag real, --/D Uncertainty in Sloan I
    zmag real, --/D Sloan z
    e_zmag real, --/D Uncertainty in Sloan z
    jmag real, --/D 2MASS J
    e_jmag real, --/D Uncertainty in 2MASS J
    hmag real, --/D 2MASS H
    e_hmag real, --/D Uncertainty in 2MASS H
    kmag real, --/D 2MASS K
    e_kmag real, --/D Uncertainty in 2MASS K
    twomflag character varying(20), --/D Quality Flags for 2MASS
    prox real, --/D Distance to 2MASS nearest neighbor
    w1mag real, --/D WISE W1
    e_w1mag real, --/D Uncertainty in WISE W1
    w2mag real, --/D WISE W2
    e_w2mag real, --/D Uncertainty in WISE W2
    w3mag real, --/D WISE W3
    e_w3mag real, --/D Uncertainty in WISE W3
    w4mag real, --/D WISE W4
    e_w4mag real, --/D Uncertainty in WISE W4
    gaiamag real, --/D GAIA G Mag
    e_gaiamag real, --/D Uncertainty in GAIA G
    tmag real, --/D TESS Magnitude
    e_tmag real, --/D Uncertainty in TESS Magnitude
    tessflag character varying(20), --/D TESS Magnitude Flag
    spflag character varying(20), --/D Stellar Properties Flag
    teff real, --/D Effective Temperature
    e_teff real, --/D Uncertainty in Effective Temperature
    logg real, --/D log of the Surface Gravity
    e_logg real, --/D Uncertainty in Surface Gravity
    mh real, --/D Metallicity
    e_mh real, --/D Uncertainty in the Metallicity
    rad real, --/D Radius
    e_rad real, --/D Uncertainty in the Radius
    mass real, --/D Mass
    e_mass real, --/D Uncertainty in the Mass
    rho real, --/D Stellar Density
    e_rho real, --/D Uncertainty in the Stellar Density
    lumclass character varying(10), --/D Luminosity Class
    lum real, --/D Stellar Luminosity
    e_lum real, --/D Uncertainty in Luminosity
    d real, --/D Distance
    e_d real, --/D Uncertainty in the distance
    ebv real, --/D Applied Color Excess
    e_ebv real, --/D Uncertainty in Applied Color Excess
    numcont integer, --/D Number of Contamination Sources
    contratio real, --/D Contamination Ratio
    disposition character varying(10), --/D Disposition type
    duplicate_id bigint, --/D Points to the duplicate object TIC ID
    priority real, --/D CTL priority
    eneg_ebv real, --/D eneg_EBV
    epos_ebv real, --/D epos_EBV
    ebvflag character varying(20), --/D EBVFlag
    eneg_mass real, --/D eneg_Mass
    epos_mass real, --/D epos_Mass
    eneg_rad real, --/D eneg_Rad
    epos_rad real, --/D epos_Rad
    eneg_rho real, --/D eneg_rho
    epos_rho real, --/D epos_rho
    eneg_logg real, --/D eneg_logg
    epos_logg real, --/D epos_logg
    eneg_lum real, --/D eneg_lum
    epos_lum real, --/D epos_lum
    eneg_dist real, --/D eneg_dist
    epos_dist real, --/D epos_dist
    distflag character varying(20), --/D distFlag
    eneg_teff real, --/D eneg_Teff
    epos_teff real, --/D epos_Teff
    tefflag character varying(20), --/D TeffFlag
    gaiabp real, --/D gaiabp
    e_gaiabp real, --/D e_gaiabp
    gaiarp real, --/D gaiarp
    e_gaiarp real, --/D e_gaiarp
    gaiaqflag integer, --/D gaiaqflag
    starchareflag character varying(20), --/D starchareFlag
    vmagflag character varying(20), --/D VmagFlag
    bmagflag character varying(20), --/D BmagFlag
    splits character varying(20), --/D splists
    e_ra double precision, --/D e_RA
    e_dec double precision, --/D e_Dec
    ra_orig double precision, --/D RA_orig
    dec_orig double precision, --/D Dec_orig
    e_ra_orig double precision, --/D e_RA_orig
    e_dec_orig double precision, --/D e_Dec_orig
    raddflag integer, --/D raddflag
    wdflag integer, --/D wdflag
    objid bigint,
    gaia_int bigint, --/D Gaia source ID (integer). Not originally in TIC v8.
    twomass_psc text, --/D 2MASS PSC identifier. Not originally in TIC v8.
    twomass_psc_pts_key integer, --/D 2MASS PSC identifier. Not originally in TIC v8.
    tycho2_tycid integer, --/D Tycho2 identifier (integer). Not originally in TIC v8.
    allwise_cntr bigint --/D ALLWISE ID (integer). Not originally in TIC v8.
);


--
-- Name: dr18_twomass_psc; Type: TABLE; Schema: minidb; Owner: -
--

CREATE TABLE minidb.dr18_twomass_psc (
    ra double precision,
    decl double precision,
    err_maj real,
    err_min real,
    err_ang smallint,
    j_m real,
    j_cmsig real,
    j_msigcom real,
    j_snr real,
    h_m real,
    h_cmsig real,
    h_msigcom real,
    h_snr real,
    k_m real,
    k_cmsig real,
    k_msigcom real,
    k_snr real,
    ph_qual character(3),
    rd_flg character(3),
    bl_flg character(3),
    cc_flg character(3),
    ndet character(6),
    prox real,
    pxpa smallint,
    pxcntr integer,
    gal_contam smallint,
    mp_flg smallint,
    pts_key integer NOT NULL,
    hemis character(1),
    date date,
    scan smallint,
    glon real,
    glat real,
    x_scan real,
    jdate double precision,
    j_psfchi real,
    h_psfchi real,
    k_psfchi real,
    j_m_stdap real,
    j_msig_stdap real,
    h_m_stdap real,
    h_msig_stdap real,
    k_m_stdap real,
    k_msig_stdap real,
    dist_edge_ns integer,
    dist_edge_ew integer,
    dist_edge_flg character(2),
    dup_src smallint,
    use_src smallint,
    a character(1),
    dist_opt real,
    phi_opt smallint,
    b_m_opt real,
    vr_m_opt real,
    nopt_mchs smallint,
    ext_key integer,
    scan_key integer,
    coadd_key integer,
    coadd smallint,
    designation text
);


--
-- Name: dr18_tycho2; Type: TABLE; Schema: minidb; Owner: -
--

CREATE TABLE minidb.dr18_tycho2 (
    tyc1 integer,
    tyc2 integer,
    tyc3 integer,
    pflag character varying(1),
    ramdeg double precision,
    demdeg double precision,
    pmra double precision,
    pmde double precision,
    e_ramdeg integer,
    e_demdeg integer,
    e_pmra double precision,
    e_pmde double precision,
    epram double precision,
    epdem double precision,
    num integer,
    q_ramdeg double precision,
    q_demdeg double precision,
    q_pmra double precision,
    q_pmde double precision,
    btmag real,
    e_btmag real,
    vtmag real,
    e_vtmag real,
    prox integer,
    tyc character varying(1),
    hip bigint,
    ccdm character varying(3),
    radeg double precision,
    dedeg double precision,
    epra_1990 double precision,
    epde_1990 double precision,
    e_radeg double precision,
    e_dedeg double precision,
    posflg character varying(1),
    corr real,
    flag character varying(1),
    mflag character varying(1),
    designation text NOT NULL,
    tycid integer
);


--
-- Name: dr18_uvotssc1; Type: TABLE; Schema: minidb; Owner: -
--

CREATE TABLE minidb.dr18_uvotssc1 (
    name character varying(17),
    oseq bigint,
    obsid bigint,
    nf bigint,
    srcid bigint,
    radeg double precision,
    dedeg double precision,
    e_radeg double precision,
    e_dedeg double precision,
    ruvw2 real,
    ruvm2 real,
    ruvw1 real,
    ru real,
    rb real,
    rv real,
    nd bigint,
    suvw2 real,
    suvm2 real,
    suvw1 real,
    su real,
    sb real,
    sv real,
    uvw2 double precision,
    uvm2 double precision,
    uvw1 double precision,
    umag double precision,
    bmag double precision,
    vmag double precision,
    uvw2_ab double precision,
    uvm2_ab double precision,
    uvw1_ab double precision,
    u_ab double precision,
    b_ab double precision,
    v_ab double precision,
    e_uvw2 double precision,
    e_uvm2 double precision,
    e_uvw1 double precision,
    e_umag double precision,
    e_bmag double precision,
    e_vmag double precision,
    f_uvw2 double precision,
    f_uvm2 double precision,
    f_uvw1 double precision,
    f_u double precision,
    f_b double precision,
    f_v double precision,
    e_f_uvw2 double precision,
    e_f_uvm2 double precision,
    e_f_uvw1 double precision,
    e_f_u double precision,
    e_f_b double precision,
    e_f_v double precision,
    auvw2 double precision,
    auvm2 double precision,
    auvw1 double precision,
    au double precision,
    ab double precision,
    av double precision,
    buvw2 double precision,
    buvm2 double precision,
    buvw1 double precision,
    bu double precision,
    bb double precision,
    bv double precision,
    pauvw2 real,
    pauvm2 real,
    pauvw1 real,
    pau real,
    pab real,
    pav real,
    xuvw2 integer,
    xuvm2 integer,
    xuvw1 integer,
    xu integer,
    xb integer,
    xv integer,
    fuvw2 integer,
    fuvm2 integer,
    fuvw1 integer,
    fu integer,
    fb integer,
    fv integer,
    id bigint NOT NULL
);


--
-- Name: dr18_xmm_om_suss_4_1; Type: TABLE; Schema: minidb; Owner: -
--

CREATE TABLE minidb.dr18_xmm_om_suss_4_1 (
    iauname character varying(22),
    n_summary integer,
    obsid character varying(10),
    srcnum integer,
    uvw2_srcdist real,
    uvm2_srcdist real,
    uvw1_srcdist real,
    u_srcdist real,
    b_srcdist real,
    v_srcdist real,
    ra double precision,
    "dec" double precision,
    ra_hms character varying(13),
    dec_dms character varying(14),
    poserr real,
    lii double precision,
    bii double precision,
    n_obsid integer,
    uvw2_signif real,
    uvm2_signif real,
    uvw1_signif real,
    u_signif real,
    b_signif real,
    v_signif real,
    uvw2_rate real,
    uvw2_rate_err real,
    uvm2_rate real,
    uvm2_rate_err real,
    uvw1_rate real,
    uvw1_rate_err real,
    u_rate real,
    u_rate_err real,
    b_rate real,
    b_rate_err real,
    v_rate real,
    v_rate_err real,
    uvw2_ab_flux real,
    uvw2_ab_flux_err real,
    uvm2_ab_flux real,
    uvm2_ab_flux_err real,
    uvw1_ab_flux real,
    uvw1_ab_flux_err real,
    u_ab_flux real,
    u_ab_flux_err real,
    b_ab_flux real,
    b_ab_flux_err real,
    v_ab_flux real,
    v_ab_flux_err real,
    uvw2_ab_mag real,
    uvw2_ab_mag_err real,
    uvm2_ab_mag real,
    uvm2_ab_mag_err real,
    uvw1_ab_mag real,
    uvw1_ab_mag_err real,
    u_ab_mag real,
    u_ab_mag_err real,
    b_ab_mag real,
    b_ab_mag_err real,
    v_ab_mag real,
    v_ab_mag_err real,
    uvw2_vega_mag real,
    uvw2_vega_mag_err real,
    uvm2_vega_mag real,
    uvm2_vega_mag_err real,
    uvw1_vega_mag real,
    uvw1_vega_mag_err real,
    u_vega_mag real,
    u_vega_mag_err real,
    b_vega_mag real,
    b_vega_mag_err real,
    v_vega_mag real,
    v_vega_mag_err real,
    uvw2_major_axis real,
    uvm2_major_axis real,
    uvw1_major_axis real,
    u_major_axis real,
    b_major_axis real,
    v_major_axis real,
    uvw2_minor_axis real,
    uvm2_minor_axis real,
    uvw1_minor_axis real,
    u_minor_axis real,
    b_minor_axis real,
    v_minor_axis real,
    uvw2_posang real,
    uvm2_posang real,
    uvw1_posang real,
    u_posang real,
    b_posang real,
    v_posang real,
    uvw2_quality_flag smallint,
    uvm2_quality_flag smallint,
    uvw1_quality_flag smallint,
    u_quality_flag smallint,
    b_quality_flag smallint,
    v_quality_flag smallint,
    uvw2_quality_flag_st character varying(12),
    uvm2_quality_flag_st character varying(12),
    uvw1_quality_flag_st character varying(12),
    u_quality_flag_st character varying(12),
    b_quality_flag_st character varying(12),
    v_quality_flag_st character varying(12),
    uvw2_extended_flag bigint,
    uvm2_extended_flag bigint,
    uvw1_extended_flag bigint,
    u_extended_flag bigint,
    b_extended_flag bigint,
    v_extended_flag bigint,
    uvw2_sky_image character varying(4),
    uvm2_sky_image character varying(4),
    uvw1_sky_image character varying(4),
    u_sky_image character varying(4),
    b_sky_image character varying(4),
    v_sky_image character varying(4),
    pk bigint NOT NULL
);


--
-- Name: dr18_yso_clustering; Type: TABLE; Schema: minidb; Owner: -
--

CREATE TABLE minidb.dr18_yso_clustering (
----------------------------------------------------------------------
--/H YSO candidates from Kounkel et al. 2020. Please see details in the original paper: https://iopscience.iop.org/article/10.3847/1538-3881/abc0e6
----------------------------------------------------------------------
    source_id bigint NOT NULL, --/D Gaia DR2 source id 
    twomass text, --/D 2MASS ID 
    ra double precision, --/U degrees --/D Right ascention in J2000 reference frame 
    "dec" double precision, --/U degrees --/D Declination in J2000 reference frame 
    parallax real, --/U mas --/D Parallax from Gaia DR2 
    id integer, --/D Identification of a parent group from Kounkel et al. (2020) 
    g double precision, --/U mag --/D Gaia (DR2) G band magnitude 
    bp double precision, --/U mag --/D Gaia (DR2) BP band magnitude 
    rp double precision, --/U mag --/D Gaia (DR2) RP band magnitude 
    j real, --/U mag --/D 2MASS J band magnitude 
    h real, --/U mag --/D 2MASS H band magnitude 
    k real, --/U mag --/D 2MASS K band magnitude 
    age double precision, --/U log yr --/D Estimate of the age of the parent group from Kounkel et al. (2020) 
    eage double precision, --/U log yr --/D Uncertainty in age 
    av double precision, --/U mag --/D Estimate of extinction of the parent group from Kounkel et al. (2020) 
    eav double precision, --/U mag --/D Uncertainty in av 
    dist double precision, --/U pc --/D Estimate of distance of the parent group from Kounkel et al. (2020) 
    edist double precision --/U pc --/D Uncertainty in dist 
);


--
-- Name: dr18_zari18pms; Type: TABLE; Schema: minidb; Owner: -
--

CREATE TABLE minidb.dr18_zari18pms (
----------------------------------------------------------------------
--/H Pre-main sequence (PMS) catalogue from Zari+2018.
----------------------------------------------------------------------
    source bigint NOT NULL, --/D Unique source identifier (Gaia DR2 source_id) 
    glon double precision, --/U deg --/D Galactic longitude 
    glat double precision, --/U deg --/D Galactic latitude 
    plx real, --/U mas --/D Parallax 
    e_plx real, --/U mas --/D Standard error of parallax (parallax_error) 
    pmglon real, --/U mas/yr --/D Proper motion in galactic longitude 
    e_pmglon real, --/U mas/yr --/D Standard error of proper motion in galactic longitude 
    pmglat real, --/U mas/yr --/D Proper motion in galactic latitude 
    e_pmglat real, --/U mas/yr --/D Standard error of proper motion in galactic latitude 
    pmlbcorr real, --/D Correlation between proper motion in galactic longitude and proper motion in galactic latitude 
    rv real, --/U km/s --/D radial velocity 
    e_rv real, --/U km/s --/D radial velocity error 
    gmag real, --/U mag --/D G-band mean magnitude (phot_g_mean_mag) 
    bpmag real, --/U mag --/D BP-band mean magnitude (phot_bp_mean_mag) 
    rpmag real, --/U mag --/D RP-band mean magnitude (phot_g_mean_mag) 
    bp_over_rp real, --/D BP/RP excess factor 
    chi2al real, --/D AL chi-square value (astrometric_chi2_al) 
    ngal integer, --/D Number of good observation AL (astrometric_n_good_obs_al) 
    ag real, --/U mag --/D Extinction in G-band (A_G) 
    bp_rp real, --/U mag --/D Colour excess in BP-RP 
    uwe real --/D Unit Weight Error, as defined in Lindegren et al., 2018A&A...616A...2L 
);


--
-- Name: dr18_targeting_generation pk; Type: DEFAULT; Schema: minidb; Owner: -
--

ALTER TABLE ONLY minidb.dr18_targeting_generation ALTER COLUMN pk SET DEFAULT nextval('minidb.dr18_targeting_generation_pk_seq'::regclass);


--
-- Name: dr18_allwise dr18_allwise_pkey; Type: CONSTRAINT; Schema: minidb; Owner: -
--

ALTER TABLE ONLY minidb.dr18_allwise
    ADD CONSTRAINT dr18_allwise_pkey PRIMARY KEY (cntr);


--
-- Name: dr18_best_brightest dr18_best_brightest_pkey; Type: CONSTRAINT; Schema: minidb; Owner: -
--

ALTER TABLE ONLY minidb.dr18_best_brightest
    ADD CONSTRAINT dr18_best_brightest_pkey PRIMARY KEY (cntr);


--
-- Name: dr18_bhm_csc_v2 dr18_bhm_csc_v2_pkey; Type: CONSTRAINT; Schema: minidb; Owner: -
--

ALTER TABLE ONLY minidb.dr18_bhm_csc_v2
    ADD CONSTRAINT dr18_bhm_csc_v2_pkey PRIMARY KEY (pk);


--
-- Name: dr18_bhm_efeds_veto dr18_bhm_efeds_veto_pkey; Type: CONSTRAINT; Schema: minidb; Owner: -
--

ALTER TABLE ONLY minidb.dr18_bhm_efeds_veto
    ADD CONSTRAINT dr18_bhm_efeds_veto_pkey PRIMARY KEY (pk);


--
-- Name: dr18_bhm_rm_v0_2 dr18_bhm_rm_v0_2_pkey; Type: CONSTRAINT; Schema: minidb; Owner: -
--

ALTER TABLE ONLY minidb.dr18_bhm_rm_v0_2
    ADD CONSTRAINT dr18_bhm_rm_v0_2_pkey PRIMARY KEY (pk);


--
-- Name: dr18_cadence_epoch dr18_cadence_epoch_pkey; Type: CONSTRAINT; Schema: minidb; Owner: -
--

ALTER TABLE ONLY minidb.dr18_cadence_epoch
    ADD CONSTRAINT dr18_cadence_epoch_pkey PRIMARY KEY (label, epoch);


--
-- Name: dr18_cadence dr18_cadence_pkey; Type: CONSTRAINT; Schema: minidb; Owner: -
--

ALTER TABLE ONLY minidb.dr18_cadence
    ADD CONSTRAINT dr18_cadence_pkey PRIMARY KEY (pk);


--
-- Name: dr18_carton dr18_carton_pkey; Type: CONSTRAINT; Schema: minidb; Owner: -
--

ALTER TABLE ONLY minidb.dr18_carton
    ADD CONSTRAINT dr18_carton_pkey PRIMARY KEY (carton_pk);


--
-- Name: dr18_carton_to_target dr18_carton_to_target_pkey; Type: CONSTRAINT; Schema: minidb; Owner: -
--

ALTER TABLE ONLY minidb.dr18_carton_to_target
    ADD CONSTRAINT dr18_carton_to_target_pkey PRIMARY KEY (carton_to_target_pk);


--
-- Name: dr18_cataclysmic_variables dr18_cataclysmic_variables_pkey; Type: CONSTRAINT; Schema: minidb; Owner: -
--

ALTER TABLE ONLY minidb.dr18_cataclysmic_variables
    ADD CONSTRAINT dr18_cataclysmic_variables_pkey PRIMARY KEY (ref_id);


--
-- Name: dr18_catalog dr18_catalog_pkey; Type: CONSTRAINT; Schema: minidb; Owner: -
--

ALTER TABLE ONLY minidb.dr18_catalog
    ADD CONSTRAINT dr18_catalog_pkey PRIMARY KEY (catalogid);


--
-- Name: dr18_catalogdb_version dr18_catalogdb_version_pkey; Type: CONSTRAINT; Schema: minidb; Owner: -
--

ALTER TABLE ONLY minidb.dr18_catalogdb_version
    ADD CONSTRAINT dr18_catalogdb_version_pkey PRIMARY KEY (id);


--
-- Name: dr18_category dr18_category_pkey; Type: CONSTRAINT; Schema: minidb; Owner: -
--

ALTER TABLE ONLY minidb.dr18_category
    ADD CONSTRAINT dr18_category_pkey PRIMARY KEY (pk);


--
-- Name: dr18_catwise2020 dr18_catwise2020_pkey; Type: CONSTRAINT; Schema: minidb; Owner: -
--

ALTER TABLE ONLY minidb.dr18_catwise2020
    ADD CONSTRAINT dr18_catwise2020_pkey PRIMARY KEY (source_id);


--
-- Name: dr18_ebosstarget_v5 dr18_ebosstarget_v5_pkey; Type: CONSTRAINT; Schema: minidb; Owner: -
--

ALTER TABLE ONLY minidb.dr18_ebosstarget_v5
    ADD CONSTRAINT dr18_ebosstarget_v5_pkey PRIMARY KEY (pk);


--
-- Name: dr18_gaia_dr2_ruwe dr18_gaia_dr2_ruwe_pkey; Type: CONSTRAINT; Schema: minidb; Owner: -
--

ALTER TABLE ONLY minidb.dr18_gaia_dr2_ruwe
    ADD CONSTRAINT dr18_gaia_dr2_ruwe_pkey PRIMARY KEY (source_id);


--
-- Name: dr18_gaia_dr2_source dr18_gaia_dr2_source_pkey; Type: CONSTRAINT; Schema: minidb; Owner: -
--

ALTER TABLE ONLY minidb.dr18_gaia_dr2_source
    ADD CONSTRAINT dr18_gaia_dr2_source_pkey PRIMARY KEY (source_id);


--
-- Name: dr18_gaia_dr2_wd dr18_gaia_dr2_wd_pkey; Type: CONSTRAINT; Schema: minidb; Owner: -
--

ALTER TABLE ONLY minidb.dr18_gaia_dr2_wd
    ADD CONSTRAINT dr18_gaia_dr2_wd_pkey PRIMARY KEY (source_id);


--
-- Name: dr18_gaia_unwise_agn dr18_gaia_unwise_agn_pkey; Type: CONSTRAINT; Schema: minidb; Owner: -
--

ALTER TABLE ONLY minidb.dr18_gaia_unwise_agn
    ADD CONSTRAINT dr18_gaia_unwise_agn_pkey PRIMARY KEY (gaia_sourceid);


--
-- Name: dr18_gaiadr2_tmass_best_neighbour dr18_gaiadr2_tmass_best_neighbour_pkey; Type: CONSTRAINT; Schema: minidb; Owner: -
--

ALTER TABLE ONLY minidb.dr18_gaiadr2_tmass_best_neighbour
    ADD CONSTRAINT dr18_gaiadr2_tmass_best_neighbour_pkey PRIMARY KEY (source_id);


--
-- Name: dr18_geometric_distances_gaia_dr2 dr18_geometric_distances_gaia_dr2_pkey; Type: CONSTRAINT; Schema: minidb; Owner: -
--

ALTER TABLE ONLY minidb.dr18_geometric_distances_gaia_dr2
    ADD CONSTRAINT dr18_geometric_distances_gaia_dr2_pkey PRIMARY KEY (source_id);


--
-- Name: dr18_glimpse dr18_glimpse_pkey; Type: CONSTRAINT; Schema: minidb; Owner: -
--

ALTER TABLE ONLY minidb.dr18_glimpse
    ADD CONSTRAINT dr18_glimpse_pkey PRIMARY KEY (pk);


--
-- Name: dr18_guvcat dr18_guvcat_pkey; Type: CONSTRAINT; Schema: minidb; Owner: -
--

ALTER TABLE ONLY minidb.dr18_guvcat
    ADD CONSTRAINT dr18_guvcat_pkey PRIMARY KEY (objid);


--
-- Name: dr18_instrument dr18_instrument_pkey; Type: CONSTRAINT; Schema: minidb; Owner: -
--

ALTER TABLE ONLY minidb.dr18_instrument
    ADD CONSTRAINT dr18_instrument_pkey PRIMARY KEY (pk);


--
-- Name: dr18_legacy_survey_dr8 dr18_legacy_survey_dr8_pkey; Type: CONSTRAINT; Schema: minidb; Owner: -
--

ALTER TABLE ONLY minidb.dr18_legacy_survey_dr8
    ADD CONSTRAINT dr18_legacy_survey_dr8_pkey PRIMARY KEY (ls_id);


--
-- Name: dr18_magnitude dr18_magnitude_pkey; Type: CONSTRAINT; Schema: minidb; Owner: -
--

ALTER TABLE ONLY minidb.dr18_magnitude
    ADD CONSTRAINT dr18_magnitude_pkey PRIMARY KEY (magnitude_pk);


--
-- Name: dr18_mapper dr18_mapper_pkey; Type: CONSTRAINT; Schema: minidb; Owner: -
--

ALTER TABLE ONLY minidb.dr18_mapper
    ADD CONSTRAINT dr18_mapper_pkey PRIMARY KEY (pk);


--
-- Name: dr18_panstarrs1 dr18_panstarrs1_pkey; Type: CONSTRAINT; Schema: minidb; Owner: -
--

ALTER TABLE ONLY minidb.dr18_panstarrs1
    ADD CONSTRAINT dr18_panstarrs1_pkey PRIMARY KEY (catid_objid);


--
-- Name: dr18_sagitta dr18_sagitta_pkey; Type: CONSTRAINT; Schema: minidb; Owner: -
--

ALTER TABLE ONLY minidb.dr18_sagitta
    ADD CONSTRAINT dr18_sagitta_pkey PRIMARY KEY (source_id);


--
-- Name: dr18_sdss_apogeeallstarmerge_r13 dr18_sdss_apogeeallstarmerge_r13_pkey; Type: CONSTRAINT; Schema: minidb; Owner: -
--

ALTER TABLE ONLY minidb.dr18_sdss_apogeeallstarmerge_r13
    ADD CONSTRAINT dr18_sdss_apogeeallstarmerge_r13_pkey PRIMARY KEY (apogee_id);


--
-- Name: dr18_sdss_dr13_photoobj_primary dr18_sdss_dr13_photoobj_primary_pkey; Type: CONSTRAINT; Schema: minidb; Owner: -
--

ALTER TABLE ONLY minidb.dr18_sdss_dr13_photoobj_primary
    ADD CONSTRAINT dr18_sdss_dr13_photoobj_primary_pkey PRIMARY KEY (objid);


--
-- Name: dr18_sdss_dr16_qso dr18_sdss_dr16_qso_pkey; Type: CONSTRAINT; Schema: minidb; Owner: -
--

ALTER TABLE ONLY minidb.dr18_sdss_dr16_qso
    ADD CONSTRAINT dr18_sdss_dr16_qso_pkey PRIMARY KEY (pk);


--
-- Name: dr18_sdss_dr16_specobj dr18_sdss_dr16_specobj_pkey; Type: CONSTRAINT; Schema: minidb; Owner: -
--

ALTER TABLE ONLY minidb.dr18_sdss_dr16_specobj
    ADD CONSTRAINT dr18_sdss_dr16_specobj_pkey PRIMARY KEY (specobjid);


--
-- Name: dr18_skies_v2 dr18_skies_v2_pkey; Type: CONSTRAINT; Schema: minidb; Owner: -
--

ALTER TABLE ONLY minidb.dr18_skies_v2
    ADD CONSTRAINT dr18_skies_v2_pkey PRIMARY KEY (pix_32768);


--
-- Name: dr18_skymapper_dr2 dr18_skymapper_dr2_pkey; Type: CONSTRAINT; Schema: minidb; Owner: -
--

ALTER TABLE ONLY minidb.dr18_skymapper_dr2
    ADD CONSTRAINT dr18_skymapper_dr2_pkey PRIMARY KEY (object_id);


--
-- Name: dr18_supercosmos dr18_supercosmos_pkey; Type: CONSTRAINT; Schema: minidb; Owner: -
--

ALTER TABLE ONLY minidb.dr18_supercosmos
    ADD CONSTRAINT dr18_supercosmos_pkey PRIMARY KEY (objid);


--
-- Name: dr18_target dr18_target_pkey; Type: CONSTRAINT; Schema: minidb; Owner: -
--

ALTER TABLE ONLY minidb.dr18_target
    ADD CONSTRAINT dr18_target_pkey PRIMARY KEY (target_pk);


--
-- Name: dr18_targetdb_version dr18_targetdb_version_pkey; Type: CONSTRAINT; Schema: minidb; Owner: -
--

ALTER TABLE ONLY minidb.dr18_targetdb_version
    ADD CONSTRAINT dr18_targetdb_version_pkey PRIMARY KEY (pk);


--
-- Name: dr18_targeting_generation dr18_targeting_generation_pkey; Type: CONSTRAINT; Schema: minidb; Owner: -
--

ALTER TABLE ONLY minidb.dr18_targeting_generation
    ADD CONSTRAINT dr18_targeting_generation_pkey PRIMARY KEY (pk);


--
-- Name: dr18_tic_v8 dr18_tic_v8_pkey; Type: CONSTRAINT; Schema: minidb; Owner: -
--

ALTER TABLE ONLY minidb.dr18_tic_v8
    ADD CONSTRAINT dr18_tic_v8_pkey PRIMARY KEY (id);


--
-- Name: dr18_twomass_psc dr18_twomass_psc_pkey; Type: CONSTRAINT; Schema: minidb; Owner: -
--

ALTER TABLE ONLY minidb.dr18_twomass_psc
    ADD CONSTRAINT dr18_twomass_psc_pkey PRIMARY KEY (pts_key);


--
-- Name: dr18_tycho2 dr18_tycho2_pkey; Type: CONSTRAINT; Schema: minidb; Owner: -
--

ALTER TABLE ONLY minidb.dr18_tycho2
    ADD CONSTRAINT dr18_tycho2_pkey PRIMARY KEY (designation);


--
-- Name: dr18_uvotssc1 dr18_uvotssc1_pkey; Type: CONSTRAINT; Schema: minidb; Owner: -
--

ALTER TABLE ONLY minidb.dr18_uvotssc1
    ADD CONSTRAINT dr18_uvotssc1_pkey PRIMARY KEY (id);


--
-- Name: dr18_xmm_om_suss_4_1 dr18_xmm_om_suss_4_1_pkey; Type: CONSTRAINT; Schema: minidb; Owner: -
--

ALTER TABLE ONLY minidb.dr18_xmm_om_suss_4_1
    ADD CONSTRAINT dr18_xmm_om_suss_4_1_pkey PRIMARY KEY (pk);


--
-- Name: dr18_yso_clustering dr18_yso_clustering_pkey; Type: CONSTRAINT; Schema: minidb; Owner: -
--

ALTER TABLE ONLY minidb.dr18_yso_clustering
    ADD CONSTRAINT dr18_yso_clustering_pkey PRIMARY KEY (source_id);


--
-- Name: dr18_zari18pms dr18_zari18pms_pkey; Type: CONSTRAINT; Schema: minidb; Owner: -
--

ALTER TABLE ONLY minidb.dr18_zari18pms
    ADD CONSTRAINT dr18_zari18pms_pkey PRIMARY KEY (source);


--
-- Name: dr18_allwise_designation_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_allwise_designation_idx ON minidb.dr18_allwise USING btree (designation);


--
-- Name: dr18_allwise_expr_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_allwise_expr_idx ON minidb.dr18_allwise USING btree (((w1mpro - w2mpro)));


--
-- Name: dr18_allwise_ph_qual_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_allwise_ph_qual_idx ON minidb.dr18_allwise USING btree (ph_qual);


--
-- Name: dr18_allwise_w1mpro_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_allwise_w1mpro_idx ON minidb.dr18_allwise USING btree (w1mpro);


--
-- Name: dr18_allwise_w1sigmpro_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_allwise_w1sigmpro_idx ON minidb.dr18_allwise USING btree (w1sigmpro);


--
-- Name: dr18_allwise_w2mpro_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_allwise_w2mpro_idx ON minidb.dr18_allwise USING btree (w2mpro);


--
-- Name: dr18_allwise_w2sigmpro_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_allwise_w2sigmpro_idx ON minidb.dr18_allwise USING btree (w2sigmpro);


--
-- Name: dr18_allwise_w3mpro_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_allwise_w3mpro_idx ON minidb.dr18_allwise USING btree (w3mpro);


--
-- Name: dr18_allwise_w3sigmpro_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_allwise_w3sigmpro_idx ON minidb.dr18_allwise USING btree (w3sigmpro);


--
-- Name: dr18_best_brightest_gmag_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_best_brightest_gmag_idx ON minidb.dr18_best_brightest USING btree (gmag);


--
-- Name: dr18_best_brightest_version_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_best_brightest_version_idx ON minidb.dr18_best_brightest USING btree (version);


--
-- Name: dr18_bhm_csc_v2_cxoid_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_bhm_csc_v2_cxoid_idx ON minidb.dr18_bhm_csc_v2 USING btree (cxoid);


--
-- Name: dr18_bhm_csc_v2_designation2m_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_bhm_csc_v2_designation2m_idx ON minidb.dr18_bhm_csc_v2 USING btree (designation2m);


--
-- Name: dr18_bhm_csc_v2_hmag_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_bhm_csc_v2_hmag_idx ON minidb.dr18_bhm_csc_v2 USING btree (hmag);


--
-- Name: dr18_bhm_csc_v2_idg2_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_bhm_csc_v2_idg2_idx ON minidb.dr18_bhm_csc_v2 USING btree (idg2);


--
-- Name: dr18_bhm_csc_v2_idps_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_bhm_csc_v2_idps_idx ON minidb.dr18_bhm_csc_v2 USING btree (idps);


--
-- Name: dr18_bhm_csc_v2_ocat_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_bhm_csc_v2_ocat_idx ON minidb.dr18_bhm_csc_v2 USING btree (ocat);


--
-- Name: dr18_bhm_csc_v2_oid_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_bhm_csc_v2_oid_idx ON minidb.dr18_bhm_csc_v2 USING btree (oid);


--
-- Name: dr18_bhm_csc_v2_omag_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_bhm_csc_v2_omag_idx ON minidb.dr18_bhm_csc_v2 USING btree (omag);


--
-- Name: dr18_bhm_efeds_veto_fiberid_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_bhm_efeds_veto_fiberid_idx ON minidb.dr18_bhm_efeds_veto USING btree (fiberid);


--
-- Name: dr18_bhm_efeds_veto_mjd_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_bhm_efeds_veto_mjd_idx ON minidb.dr18_bhm_efeds_veto USING btree (mjd);


--
-- Name: dr18_bhm_efeds_veto_plate_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_bhm_efeds_veto_plate_idx ON minidb.dr18_bhm_efeds_veto USING btree (plate);


--
-- Name: dr18_bhm_efeds_veto_run2d_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_bhm_efeds_veto_run2d_idx ON minidb.dr18_bhm_efeds_veto USING btree (run2d);


--
-- Name: dr18_bhm_efeds_veto_tile_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_bhm_efeds_veto_tile_idx ON minidb.dr18_bhm_efeds_veto USING btree (tile);


--
-- Name: dr18_bhm_rm_v0_2_coadd_object_id_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_bhm_rm_v0_2_coadd_object_id_idx ON minidb.dr18_bhm_rm_v0_2 USING btree (coadd_object_id);


--
-- Name: dr18_bhm_rm_v0_2_id_nsc_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_bhm_rm_v0_2_id_nsc_idx ON minidb.dr18_bhm_rm_v0_2 USING btree (id_nsc);


--
-- Name: dr18_bhm_rm_v0_2_objid_ps1_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_bhm_rm_v0_2_objid_ps1_idx ON minidb.dr18_bhm_rm_v0_2 USING btree (objid_ps1);


--
-- Name: dr18_bhm_rm_v0_2_objid_sdss_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_bhm_rm_v0_2_objid_sdss_idx ON minidb.dr18_bhm_rm_v0_2 USING btree (objid_sdss);


--
-- Name: dr18_bhm_rm_v0_2_objid_unwise_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_bhm_rm_v0_2_objid_unwise_idx ON minidb.dr18_bhm_rm_v0_2 USING btree (objid_unwise);


--
-- Name: dr18_bhm_rm_v0_2_source_id_gaia_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_bhm_rm_v0_2_source_id_gaia_idx ON minidb.dr18_bhm_rm_v0_2 USING btree (source_id_gaia);


--
-- Name: dr18_bhm_rm_v0_2_sourceid_ir_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_bhm_rm_v0_2_sourceid_ir_idx ON minidb.dr18_bhm_rm_v0_2 USING btree (sourceid_ir);


--
-- Name: dr18_cadence_epoch_cadence_pk_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_cadence_epoch_cadence_pk_idx ON minidb.dr18_cadence_epoch USING btree (cadence_pk);


--
-- Name: dr18_cadence_epoch_label_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_cadence_epoch_label_idx ON minidb.dr18_cadence_epoch USING btree (label);


--
-- Name: dr18_cadence_label_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE UNIQUE INDEX dr18_cadence_label_idx ON minidb.dr18_cadence USING btree (label);


--
-- Name: dr18_carton_to_target_cadence_pk_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_carton_to_target_cadence_pk_idx ON minidb.dr18_carton_to_target USING btree (cadence_pk);


--
-- Name: dr18_carton_to_target_carton_pk_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_carton_to_target_carton_pk_idx ON minidb.dr18_carton_to_target USING btree (carton_pk);


--
-- Name: dr18_carton_to_target_instrument_pk_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_carton_to_target_instrument_pk_idx ON minidb.dr18_carton_to_target USING btree (instrument_pk);


--
-- Name: dr18_carton_to_target_target_pk_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_carton_to_target_target_pk_idx ON minidb.dr18_carton_to_target USING btree (target_pk);


--
-- Name: dr18_cataclysmic_variables_source_id_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_cataclysmic_variables_source_id_idx ON minidb.dr18_cataclysmic_variables USING btree (source_id);


--
-- Name: dr18_catalog_to_allwise_best_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_catalog_to_allwise_best_idx ON minidb.dr18_catalog_to_allwise USING btree (best);


--
-- Name: dr18_catalog_to_allwise_catalogid_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_catalog_to_allwise_catalogid_idx ON minidb.dr18_catalog_to_allwise USING btree (catalogid);


--
-- Name: dr18_catalog_to_allwise_target_id_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_catalog_to_allwise_target_id_idx ON minidb.dr18_catalog_to_allwise USING btree (target_id);


--
-- Name: dr18_catalog_to_allwise_version_id_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_catalog_to_allwise_version_id_idx ON minidb.dr18_catalog_to_allwise USING btree (version_id);


--
-- Name: dr18_catalog_to_bhm_efeds_veto_best_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_catalog_to_bhm_efeds_veto_best_idx ON minidb.dr18_catalog_to_bhm_efeds_veto USING btree (best);


--
-- Name: dr18_catalog_to_bhm_efeds_veto_catalogid_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_catalog_to_bhm_efeds_veto_catalogid_idx ON minidb.dr18_catalog_to_bhm_efeds_veto USING btree (catalogid);


--
-- Name: dr18_catalog_to_bhm_efeds_veto_target_id_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_catalog_to_bhm_efeds_veto_target_id_idx ON minidb.dr18_catalog_to_bhm_efeds_veto USING btree (target_id);


--
-- Name: dr18_catalog_to_bhm_efeds_veto_version_id_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_catalog_to_bhm_efeds_veto_version_id_idx ON minidb.dr18_catalog_to_bhm_efeds_veto USING btree (version_id);


--
-- Name: dr18_catalog_to_bhm_rm_v0_2_best_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_catalog_to_bhm_rm_v0_2_best_idx ON minidb.dr18_catalog_to_bhm_rm_v0_2 USING btree (best);


--
-- Name: dr18_catalog_to_bhm_rm_v0_2_catalogid_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_catalog_to_bhm_rm_v0_2_catalogid_idx ON minidb.dr18_catalog_to_bhm_rm_v0_2 USING btree (catalogid);


--
-- Name: dr18_catalog_to_bhm_rm_v0_2_target_id_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_catalog_to_bhm_rm_v0_2_target_id_idx ON minidb.dr18_catalog_to_bhm_rm_v0_2 USING btree (target_id);


--
-- Name: dr18_catalog_to_bhm_rm_v0_2_version_id_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_catalog_to_bhm_rm_v0_2_version_id_idx ON minidb.dr18_catalog_to_bhm_rm_v0_2 USING btree (version_id);


--
-- Name: dr18_catalog_to_catwise2020_best_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_catalog_to_catwise2020_best_idx ON minidb.dr18_catalog_to_catwise2020 USING btree (best);


--
-- Name: dr18_catalog_to_catwise2020_catalogid_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_catalog_to_catwise2020_catalogid_idx ON minidb.dr18_catalog_to_catwise2020 USING btree (catalogid);


--
-- Name: dr18_catalog_to_catwise2020_target_id_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_catalog_to_catwise2020_target_id_idx ON minidb.dr18_catalog_to_catwise2020 USING btree (target_id);


--
-- Name: dr18_catalog_to_catwise2020_version_id_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_catalog_to_catwise2020_version_id_idx ON minidb.dr18_catalog_to_catwise2020 USING btree (version_id);


--
-- Name: dr18_catalog_to_glimpse_best_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_catalog_to_glimpse_best_idx ON minidb.dr18_catalog_to_glimpse USING btree (best);


--
-- Name: dr18_catalog_to_glimpse_catalogid_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_catalog_to_glimpse_catalogid_idx ON minidb.dr18_catalog_to_glimpse USING btree (catalogid);


--
-- Name: dr18_catalog_to_glimpse_target_id_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_catalog_to_glimpse_target_id_idx ON minidb.dr18_catalog_to_glimpse USING btree (target_id);


--
-- Name: dr18_catalog_to_glimpse_version_id_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_catalog_to_glimpse_version_id_idx ON minidb.dr18_catalog_to_glimpse USING btree (version_id);


--
-- Name: dr18_catalog_to_guvcat_best_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_catalog_to_guvcat_best_idx ON minidb.dr18_catalog_to_guvcat USING btree (best);


--
-- Name: dr18_catalog_to_guvcat_catalogid_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_catalog_to_guvcat_catalogid_idx ON minidb.dr18_catalog_to_guvcat USING btree (catalogid);


--
-- Name: dr18_catalog_to_guvcat_target_id_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_catalog_to_guvcat_target_id_idx ON minidb.dr18_catalog_to_guvcat USING btree (target_id);


--
-- Name: dr18_catalog_to_guvcat_version_id_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_catalog_to_guvcat_version_id_idx ON minidb.dr18_catalog_to_guvcat USING btree (version_id);


--
-- Name: dr18_catalog_to_legacy_survey_dr8_best_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_catalog_to_legacy_survey_dr8_best_idx ON minidb.dr18_catalog_to_legacy_survey_dr8 USING btree (best);


--
-- Name: dr18_catalog_to_legacy_survey_dr8_catalogid_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_catalog_to_legacy_survey_dr8_catalogid_idx ON minidb.dr18_catalog_to_legacy_survey_dr8 USING btree (catalogid);


--
-- Name: dr18_catalog_to_legacy_survey_dr8_target_id_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_catalog_to_legacy_survey_dr8_target_id_idx ON minidb.dr18_catalog_to_legacy_survey_dr8 USING btree (target_id);


--
-- Name: dr18_catalog_to_legacy_survey_dr8_version_id_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_catalog_to_legacy_survey_dr8_version_id_idx ON minidb.dr18_catalog_to_legacy_survey_dr8 USING btree (version_id);


--
-- Name: dr18_catalog_to_panstarrs1_best_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_catalog_to_panstarrs1_best_idx ON minidb.dr18_catalog_to_panstarrs1 USING btree (best);


--
-- Name: dr18_catalog_to_panstarrs1_catalogid_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_catalog_to_panstarrs1_catalogid_idx ON minidb.dr18_catalog_to_panstarrs1 USING btree (catalogid);


--
-- Name: dr18_catalog_to_panstarrs1_target_id_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_catalog_to_panstarrs1_target_id_idx ON minidb.dr18_catalog_to_panstarrs1 USING btree (target_id);


--
-- Name: dr18_catalog_to_panstarrs1_version_id_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_catalog_to_panstarrs1_version_id_idx ON minidb.dr18_catalog_to_panstarrs1 USING btree (version_id);


--
-- Name: dr18_catalog_to_sdss_dr13_photoobj_primary_best_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_catalog_to_sdss_dr13_photoobj_primary_best_idx ON minidb.dr18_catalog_to_sdss_dr13_photoobj_primary USING btree (best);


--
-- Name: dr18_catalog_to_sdss_dr13_photoobj_primary_catalogid_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_catalog_to_sdss_dr13_photoobj_primary_catalogid_idx ON minidb.dr18_catalog_to_sdss_dr13_photoobj_primary USING btree (catalogid);


--
-- Name: dr18_catalog_to_sdss_dr13_photoobj_primary_target_id_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_catalog_to_sdss_dr13_photoobj_primary_target_id_idx ON minidb.dr18_catalog_to_sdss_dr13_photoobj_primary USING btree (target_id);


--
-- Name: dr18_catalog_to_sdss_dr13_photoobj_primary_version_id_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_catalog_to_sdss_dr13_photoobj_primary_version_id_idx ON minidb.dr18_catalog_to_sdss_dr13_photoobj_primary USING btree (version_id);


--
-- Name: dr18_catalog_to_sdss_dr16_specobj_best_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_catalog_to_sdss_dr16_specobj_best_idx ON minidb.dr18_catalog_to_sdss_dr16_specobj USING btree (best);


--
-- Name: dr18_catalog_to_sdss_dr16_specobj_catalogid_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_catalog_to_sdss_dr16_specobj_catalogid_idx ON minidb.dr18_catalog_to_sdss_dr16_specobj USING btree (catalogid);


--
-- Name: dr18_catalog_to_sdss_dr16_specobj_target_id_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_catalog_to_sdss_dr16_specobj_target_id_idx ON minidb.dr18_catalog_to_sdss_dr16_specobj USING btree (target_id);


--
-- Name: dr18_catalog_to_sdss_dr16_specobj_version_id_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_catalog_to_sdss_dr16_specobj_version_id_idx ON minidb.dr18_catalog_to_sdss_dr16_specobj USING btree (version_id);


--
-- Name: dr18_catalog_to_skies_v2_best_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_catalog_to_skies_v2_best_idx ON minidb.dr18_catalog_to_skies_v2 USING btree (best);


--
-- Name: dr18_catalog_to_skies_v2_catalogid_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_catalog_to_skies_v2_catalogid_idx ON minidb.dr18_catalog_to_skies_v2 USING btree (catalogid);


--
-- Name: dr18_catalog_to_skies_v2_target_id_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_catalog_to_skies_v2_target_id_idx ON minidb.dr18_catalog_to_skies_v2 USING btree (target_id);


--
-- Name: dr18_catalog_to_skies_v2_version_id_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_catalog_to_skies_v2_version_id_idx ON minidb.dr18_catalog_to_skies_v2 USING btree (version_id);


--
-- Name: dr18_catalog_to_skymapper_dr2_best_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_catalog_to_skymapper_dr2_best_idx ON minidb.dr18_catalog_to_skymapper_dr2 USING btree (best);


--
-- Name: dr18_catalog_to_skymapper_dr2_catalogid_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_catalog_to_skymapper_dr2_catalogid_idx ON minidb.dr18_catalog_to_skymapper_dr2 USING btree (catalogid);


--
-- Name: dr18_catalog_to_skymapper_dr2_target_id_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_catalog_to_skymapper_dr2_target_id_idx ON minidb.dr18_catalog_to_skymapper_dr2 USING btree (target_id);


--
-- Name: dr18_catalog_to_skymapper_dr2_version_id_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_catalog_to_skymapper_dr2_version_id_idx ON minidb.dr18_catalog_to_skymapper_dr2 USING btree (version_id);


--
-- Name: dr18_catalog_to_supercosmos_best_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_catalog_to_supercosmos_best_idx ON minidb.dr18_catalog_to_supercosmos USING btree (best);


--
-- Name: dr18_catalog_to_supercosmos_catalogid_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_catalog_to_supercosmos_catalogid_idx ON minidb.dr18_catalog_to_supercosmos USING btree (catalogid);


--
-- Name: dr18_catalog_to_supercosmos_target_id_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_catalog_to_supercosmos_target_id_idx ON minidb.dr18_catalog_to_supercosmos USING btree (target_id);


--
-- Name: dr18_catalog_to_supercosmos_version_id_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_catalog_to_supercosmos_version_id_idx ON minidb.dr18_catalog_to_supercosmos USING btree (version_id);


--
-- Name: dr18_catalog_to_tic_v8_best_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_catalog_to_tic_v8_best_idx ON minidb.dr18_catalog_to_tic_v8 USING btree (best);


--
-- Name: dr18_catalog_to_tic_v8_catalogid_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_catalog_to_tic_v8_catalogid_idx ON minidb.dr18_catalog_to_tic_v8 USING btree (catalogid);


--
-- Name: dr18_catalog_to_tic_v8_target_id_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_catalog_to_tic_v8_target_id_idx ON minidb.dr18_catalog_to_tic_v8 USING btree (target_id);


--
-- Name: dr18_catalog_to_tic_v8_version_id_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_catalog_to_tic_v8_version_id_idx ON minidb.dr18_catalog_to_tic_v8 USING btree (version_id);


--
-- Name: dr18_catalog_to_tycho2_best_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_catalog_to_tycho2_best_idx ON minidb.dr18_catalog_to_tycho2 USING btree (best);


--
-- Name: dr18_catalog_to_tycho2_catalogid_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_catalog_to_tycho2_catalogid_idx ON minidb.dr18_catalog_to_tycho2 USING btree (catalogid);


--
-- Name: dr18_catalog_to_tycho2_target_id_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_catalog_to_tycho2_target_id_idx ON minidb.dr18_catalog_to_tycho2 USING btree (target_id);


--
-- Name: dr18_catalog_to_tycho2_version_id_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_catalog_to_tycho2_version_id_idx ON minidb.dr18_catalog_to_tycho2 USING btree (version_id);


--
-- Name: dr18_catalog_to_uvotssc1_best_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_catalog_to_uvotssc1_best_idx ON minidb.dr18_catalog_to_uvotssc1 USING btree (best);


--
-- Name: dr18_catalog_to_uvotssc1_catalogid_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_catalog_to_uvotssc1_catalogid_idx ON minidb.dr18_catalog_to_uvotssc1 USING btree (catalogid);


--
-- Name: dr18_catalog_to_uvotssc1_target_id_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_catalog_to_uvotssc1_target_id_idx ON minidb.dr18_catalog_to_uvotssc1 USING btree (target_id);


--
-- Name: dr18_catalog_to_uvotssc1_version_id_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_catalog_to_uvotssc1_version_id_idx ON minidb.dr18_catalog_to_uvotssc1 USING btree (version_id);


--
-- Name: dr18_catalog_to_xmm_om_suss_4_1_best_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_catalog_to_xmm_om_suss_4_1_best_idx ON minidb.dr18_catalog_to_xmm_om_suss_4_1 USING btree (best);


--
-- Name: dr18_catalog_to_xmm_om_suss_4_1_catalogid_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_catalog_to_xmm_om_suss_4_1_catalogid_idx ON minidb.dr18_catalog_to_xmm_om_suss_4_1 USING btree (catalogid);


--
-- Name: dr18_catalog_to_xmm_om_suss_4_1_target_id_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_catalog_to_xmm_om_suss_4_1_target_id_idx ON minidb.dr18_catalog_to_xmm_om_suss_4_1 USING btree (target_id);


--
-- Name: dr18_catalog_to_xmm_om_suss_4_1_version_id_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_catalog_to_xmm_om_suss_4_1_version_id_idx ON minidb.dr18_catalog_to_xmm_om_suss_4_1 USING btree (version_id);


--
-- Name: dr18_catalog_version_id_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_catalog_version_id_idx ON minidb.dr18_catalog USING btree (version_id);


--
-- Name: dr18_catalogdb_version_plan_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE UNIQUE INDEX dr18_catalogdb_version_plan_idx ON minidb.dr18_catalogdb_version USING btree (plan);


--
-- Name: dr18_catwise2020_source_name_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_catwise2020_source_name_idx ON minidb.dr18_catwise2020 USING btree (source_name);


--
-- Name: dr18_catwise2020_w1mpro_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_catwise2020_w1mpro_idx ON minidb.dr18_catwise2020 USING btree (w1mpro);


--
-- Name: dr18_catwise2020_w1sigmpro_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_catwise2020_w1sigmpro_idx ON minidb.dr18_catwise2020 USING btree (w1sigmpro);


--
-- Name: dr18_catwise2020_w2mpro_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_catwise2020_w2mpro_idx ON minidb.dr18_catwise2020 USING btree (w2mpro);


--
-- Name: dr18_catwise2020_w2sigmpro_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_catwise2020_w2sigmpro_idx ON minidb.dr18_catwise2020 USING btree (w2sigmpro);


--
-- Name: dr18_ebosstarget_v5_eboss_target1_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_ebosstarget_v5_eboss_target1_idx ON minidb.dr18_ebosstarget_v5 USING btree (eboss_target1);


--
-- Name: dr18_ebosstarget_v5_objc_type_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_ebosstarget_v5_objc_type_idx ON minidb.dr18_ebosstarget_v5 USING btree (objc_type);


--
-- Name: dr18_ebosstarget_v5_objid_targeting_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_ebosstarget_v5_objid_targeting_idx ON minidb.dr18_ebosstarget_v5 USING btree (objid_targeting);


--
-- Name: dr18_ebosstarget_v5_resolve_status_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_ebosstarget_v5_resolve_status_idx ON minidb.dr18_ebosstarget_v5 USING btree (resolve_status);


--
-- Name: dr18_gaia_dr2_ruwe_ruwe_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_gaia_dr2_ruwe_ruwe_idx ON minidb.dr18_gaia_dr2_ruwe USING btree (ruwe);


--
-- Name: dr18_gaia_dr2_source_astrometric_chi2_al_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_gaia_dr2_source_astrometric_chi2_al_idx ON minidb.dr18_gaia_dr2_source USING btree (astrometric_chi2_al);


--
-- Name: dr18_gaia_dr2_source_astrometric_excess_noise_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_gaia_dr2_source_astrometric_excess_noise_idx ON minidb.dr18_gaia_dr2_source USING btree (astrometric_excess_noise);


--
-- Name: dr18_gaia_dr2_source_bp_rp_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_gaia_dr2_source_bp_rp_idx ON minidb.dr18_gaia_dr2_source USING btree (bp_rp);


--
-- Name: dr18_gaia_dr2_source_expr_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_gaia_dr2_source_expr_idx ON minidb.dr18_gaia_dr2_source USING btree (((parallax - parallax_error)));


--
-- Name: dr18_gaia_dr2_source_parallax_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_gaia_dr2_source_parallax_idx ON minidb.dr18_gaia_dr2_source USING btree (parallax);


--
-- Name: dr18_gaia_dr2_source_phot_bp_mean_flux_over_error_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_gaia_dr2_source_phot_bp_mean_flux_over_error_idx ON minidb.dr18_gaia_dr2_source USING btree (phot_bp_mean_flux_over_error);


--
-- Name: dr18_gaia_dr2_source_phot_bp_mean_mag_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_gaia_dr2_source_phot_bp_mean_mag_idx ON minidb.dr18_gaia_dr2_source USING btree (phot_bp_mean_mag);


--
-- Name: dr18_gaia_dr2_source_phot_rp_mean_mag_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_gaia_dr2_source_phot_rp_mean_mag_idx ON minidb.dr18_gaia_dr2_source USING btree (phot_rp_mean_mag);


--
-- Name: dr18_gaia_dr2_wd_gmag_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_gaia_dr2_wd_gmag_idx ON minidb.dr18_gaia_dr2_wd USING btree (gmag);


--
-- Name: dr18_gaia_dr2_wd_pwd_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_gaia_dr2_wd_pwd_idx ON minidb.dr18_gaia_dr2_wd USING btree (pwd);


--
-- Name: dr18_gaia_unwise_agn_g_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_gaia_unwise_agn_g_idx ON minidb.dr18_gaia_unwise_agn USING btree (g);


--
-- Name: dr18_gaia_unwise_agn_prob_rf_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_gaia_unwise_agn_prob_rf_idx ON minidb.dr18_gaia_unwise_agn USING btree (prob_rf);


--
-- Name: dr18_gaia_unwise_agn_unwise_objid_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_gaia_unwise_agn_unwise_objid_idx ON minidb.dr18_gaia_unwise_agn USING btree (unwise_objid);


--
-- Name: dr18_gaiadr2_tmass_best_neighbour_angular_distance_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_gaiadr2_tmass_best_neighbour_angular_distance_idx ON minidb.dr18_gaiadr2_tmass_best_neighbour USING btree (angular_distance);


--
-- Name: dr18_gaiadr2_tmass_best_neighbour_source_id_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_gaiadr2_tmass_best_neighbour_source_id_idx ON minidb.dr18_gaiadr2_tmass_best_neighbour USING btree (source_id);


--
-- Name: dr18_gaiadr2_tmass_best_neighbour_tmass_pts_key_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_gaiadr2_tmass_best_neighbour_tmass_pts_key_idx ON minidb.dr18_gaiadr2_tmass_best_neighbour USING btree (tmass_pts_key);


--
-- Name: dr18_geometric_distances_gaia_dr2_r_est_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_geometric_distances_gaia_dr2_r_est_idx ON minidb.dr18_geometric_distances_gaia_dr2 USING btree (r_est);


--
-- Name: dr18_geometric_distances_gaia_dr2_r_hi_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_geometric_distances_gaia_dr2_r_hi_idx ON minidb.dr18_geometric_distances_gaia_dr2 USING btree (r_hi);


--
-- Name: dr18_geometric_distances_gaia_dr2_r_len_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_geometric_distances_gaia_dr2_r_len_idx ON minidb.dr18_geometric_distances_gaia_dr2 USING btree (r_len);


--
-- Name: dr18_geometric_distances_gaia_dr2_r_lo_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_geometric_distances_gaia_dr2_r_lo_idx ON minidb.dr18_geometric_distances_gaia_dr2 USING btree (r_lo);


--
-- Name: dr18_glimpse_designation_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_glimpse_designation_idx ON minidb.dr18_glimpse USING btree (designation);


--
-- Name: dr18_glimpse_tmass_cntr_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_glimpse_tmass_cntr_idx ON minidb.dr18_glimpse USING btree (tmass_cntr);


--
-- Name: dr18_glimpse_tmass_designation_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_glimpse_tmass_designation_idx ON minidb.dr18_glimpse USING btree (tmass_designation);


--
-- Name: dr18_guvcat_expr_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_guvcat_expr_idx ON minidb.dr18_guvcat USING btree (((fuv_mag - nuv_mag)));


--
-- Name: dr18_guvcat_fuv_mag_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_guvcat_fuv_mag_idx ON minidb.dr18_guvcat USING btree (fuv_mag);


--
-- Name: dr18_guvcat_nuv_mag_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_guvcat_nuv_mag_idx ON minidb.dr18_guvcat USING btree (nuv_mag);


--
-- Name: dr18_legacy_survey_dr8_fibertotflux_g_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_legacy_survey_dr8_fibertotflux_g_idx ON minidb.dr18_legacy_survey_dr8 USING btree (fibertotflux_g);


--
-- Name: dr18_legacy_survey_dr8_fibertotflux_r_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_legacy_survey_dr8_fibertotflux_r_idx ON minidb.dr18_legacy_survey_dr8 USING btree (fibertotflux_r);


--
-- Name: dr18_legacy_survey_dr8_fibertotflux_z_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_legacy_survey_dr8_fibertotflux_z_idx ON minidb.dr18_legacy_survey_dr8 USING btree (fibertotflux_z);


--
-- Name: dr18_legacy_survey_dr8_flux_g_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_legacy_survey_dr8_flux_g_idx ON minidb.dr18_legacy_survey_dr8 USING btree (flux_g);


--
-- Name: dr18_legacy_survey_dr8_flux_r_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_legacy_survey_dr8_flux_r_idx ON minidb.dr18_legacy_survey_dr8 USING btree (flux_r);


--
-- Name: dr18_legacy_survey_dr8_flux_w1_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_legacy_survey_dr8_flux_w1_idx ON minidb.dr18_legacy_survey_dr8 USING btree (flux_w1);


--
-- Name: dr18_legacy_survey_dr8_flux_z_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_legacy_survey_dr8_flux_z_idx ON minidb.dr18_legacy_survey_dr8 USING btree (flux_z);


--
-- Name: dr18_legacy_survey_dr8_gaia_phot_g_mean_mag_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_legacy_survey_dr8_gaia_phot_g_mean_mag_idx ON minidb.dr18_legacy_survey_dr8 USING btree (gaia_phot_g_mean_mag);


--
-- Name: dr18_legacy_survey_dr8_gaia_phot_g_mean_mag_idx1; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_legacy_survey_dr8_gaia_phot_g_mean_mag_idx1 ON minidb.dr18_legacy_survey_dr8 USING btree (gaia_phot_g_mean_mag);


--
-- Name: dr18_legacy_survey_dr8_gaia_phot_rp_mean_mag_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_legacy_survey_dr8_gaia_phot_rp_mean_mag_idx ON minidb.dr18_legacy_survey_dr8 USING btree (gaia_phot_rp_mean_mag);


--
-- Name: dr18_legacy_survey_dr8_gaia_sourceid_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_legacy_survey_dr8_gaia_sourceid_idx ON minidb.dr18_legacy_survey_dr8 USING btree (gaia_sourceid);


--
-- Name: dr18_legacy_survey_dr8_maskbits_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_legacy_survey_dr8_maskbits_idx ON minidb.dr18_legacy_survey_dr8 USING btree (maskbits);


--
-- Name: dr18_legacy_survey_dr8_nobs_g_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_legacy_survey_dr8_nobs_g_idx ON minidb.dr18_legacy_survey_dr8 USING btree (nobs_g);


--
-- Name: dr18_legacy_survey_dr8_nobs_r_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_legacy_survey_dr8_nobs_r_idx ON minidb.dr18_legacy_survey_dr8 USING btree (nobs_r);


--
-- Name: dr18_legacy_survey_dr8_nobs_z_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_legacy_survey_dr8_nobs_z_idx ON minidb.dr18_legacy_survey_dr8 USING btree (nobs_z);


--
-- Name: dr18_legacy_survey_dr8_parallax_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_legacy_survey_dr8_parallax_idx ON minidb.dr18_legacy_survey_dr8 USING btree (parallax);


--
-- Name: dr18_legacy_survey_dr8_ref_cat_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_legacy_survey_dr8_ref_cat_idx ON minidb.dr18_legacy_survey_dr8 USING btree (ref_cat);


--
-- Name: dr18_legacy_survey_dr8_ref_epoch_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_legacy_survey_dr8_ref_epoch_idx ON minidb.dr18_legacy_survey_dr8 USING btree (ref_epoch);


--
-- Name: dr18_legacy_survey_dr8_ref_id_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_legacy_survey_dr8_ref_id_idx ON minidb.dr18_legacy_survey_dr8 USING btree (ref_id);


--
-- Name: dr18_magnitude_carton_to_target_pk_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_magnitude_carton_to_target_pk_idx ON minidb.dr18_magnitude USING btree (carton_to_target_pk);


--
-- Name: dr18_magnitude_h_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_magnitude_h_idx ON minidb.dr18_magnitude USING btree (h);


--
-- Name: dr18_panstarrs1_extid_hi_lo_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_panstarrs1_extid_hi_lo_idx ON minidb.dr18_panstarrs1 USING btree (extid_hi_lo);


--
-- Name: dr18_panstarrs1_flags_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_panstarrs1_flags_idx ON minidb.dr18_panstarrs1 USING btree (flags);


--
-- Name: dr18_panstarrs1_g_flags_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_panstarrs1_g_flags_idx ON minidb.dr18_panstarrs1 USING btree (g_flags);


--
-- Name: dr18_panstarrs1_g_stk_psf_flux_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_panstarrs1_g_stk_psf_flux_idx ON minidb.dr18_panstarrs1 USING btree (g_stk_psf_flux);


--
-- Name: dr18_panstarrs1_i_flags_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_panstarrs1_i_flags_idx ON minidb.dr18_panstarrs1 USING btree (i_flags);


--
-- Name: dr18_panstarrs1_i_stk_psf_flux_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_panstarrs1_i_stk_psf_flux_idx ON minidb.dr18_panstarrs1 USING btree (i_stk_psf_flux);


--
-- Name: dr18_panstarrs1_r_flags_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_panstarrs1_r_flags_idx ON minidb.dr18_panstarrs1 USING btree (r_flags);


--
-- Name: dr18_panstarrs1_r_stk_psf_flux_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_panstarrs1_r_stk_psf_flux_idx ON minidb.dr18_panstarrs1 USING btree (r_stk_psf_flux);


--
-- Name: dr18_panstarrs1_stargal_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_panstarrs1_stargal_idx ON minidb.dr18_panstarrs1 USING btree (stargal);


--
-- Name: dr18_panstarrs1_z_flags_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_panstarrs1_z_flags_idx ON minidb.dr18_panstarrs1 USING btree (z_flags);


--
-- Name: dr18_panstarrs1_z_stk_psf_flux_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_panstarrs1_z_stk_psf_flux_idx ON minidb.dr18_panstarrs1 USING btree (z_stk_psf_flux);


--
-- Name: dr18_sagitta_av_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_sagitta_av_idx ON minidb.dr18_sagitta USING btree (av);


--
-- Name: dr18_sagitta_yso_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_sagitta_yso_idx ON minidb.dr18_sagitta USING btree (yso);


--
-- Name: dr18_sagitta_yso_std_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_sagitta_yso_std_idx ON minidb.dr18_sagitta USING btree (yso_std);


--
-- Name: dr18_sdss_apogeeallstarmerge_r13_h_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_sdss_apogeeallstarmerge_r13_h_idx ON minidb.dr18_sdss_apogeeallstarmerge_r13 USING btree (h);


--
-- Name: dr18_sdss_apogeeallstarmerge_r13_j_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_sdss_apogeeallstarmerge_r13_j_idx ON minidb.dr18_sdss_apogeeallstarmerge_r13 USING btree (j);


--
-- Name: dr18_sdss_apogeeallstarmerge_r13_k_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_sdss_apogeeallstarmerge_r13_k_idx ON minidb.dr18_sdss_apogeeallstarmerge_r13 USING btree (k);


--
-- Name: dr18_sdss_dr13_photoobj_primary_objid_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_sdss_dr13_photoobj_primary_objid_idx ON minidb.dr18_sdss_dr13_photoobj_primary USING btree (objid);


--
-- Name: dr18_sdss_dr16_qso_fiberid_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_sdss_dr16_qso_fiberid_idx ON minidb.dr18_sdss_dr16_qso USING btree (fiberid);


--
-- Name: dr18_sdss_dr16_qso_mjd_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_sdss_dr16_qso_mjd_idx ON minidb.dr18_sdss_dr16_qso USING btree (mjd);


--
-- Name: dr18_sdss_dr16_qso_mjd_plate_fiberid_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_sdss_dr16_qso_mjd_plate_fiberid_idx ON minidb.dr18_sdss_dr16_qso USING btree (mjd, plate, fiberid);


--
-- Name: dr18_sdss_dr16_qso_plate_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_sdss_dr16_qso_plate_idx ON minidb.dr18_sdss_dr16_qso USING btree (plate);


--
-- Name: dr18_sdss_dr16_specobj_bestobjid_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_sdss_dr16_specobj_bestobjid_idx ON minidb.dr18_sdss_dr16_specobj USING btree (bestobjid);


--
-- Name: dr18_sdss_dr16_specobj_fiberid_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_sdss_dr16_specobj_fiberid_idx ON minidb.dr18_sdss_dr16_specobj USING btree (fiberid);


--
-- Name: dr18_sdss_dr16_specobj_fluxobjid_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_sdss_dr16_specobj_fluxobjid_idx ON minidb.dr18_sdss_dr16_specobj USING btree (fluxobjid);


--
-- Name: dr18_sdss_dr16_specobj_mjd_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_sdss_dr16_specobj_mjd_idx ON minidb.dr18_sdss_dr16_specobj USING btree (mjd);


--
-- Name: dr18_sdss_dr16_specobj_mjd_plate_fiberid_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE UNIQUE INDEX dr18_sdss_dr16_specobj_mjd_plate_fiberid_idx ON minidb.dr18_sdss_dr16_specobj USING btree (mjd, plate, fiberid);


--
-- Name: dr18_sdss_dr16_specobj_mjd_plate_fiberid_idx1; Type: INDEX; Schema: minidb; Owner: -
--

CREATE UNIQUE INDEX dr18_sdss_dr16_specobj_mjd_plate_fiberid_idx1 ON minidb.dr18_sdss_dr16_specobj USING btree (mjd, plate, fiberid);


--
-- Name: dr18_sdss_dr16_specobj_plate_fiberid_mjd_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE UNIQUE INDEX dr18_sdss_dr16_specobj_plate_fiberid_mjd_idx ON minidb.dr18_sdss_dr16_specobj USING btree (plate, fiberid, mjd);


--
-- Name: dr18_sdss_dr16_specobj_plate_fiberid_mjd_idx1; Type: INDEX; Schema: minidb; Owner: -
--

CREATE UNIQUE INDEX dr18_sdss_dr16_specobj_plate_fiberid_mjd_idx1 ON minidb.dr18_sdss_dr16_specobj USING btree (plate, fiberid, mjd);


--
-- Name: dr18_sdss_dr16_specobj_plate_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_sdss_dr16_specobj_plate_idx ON minidb.dr18_sdss_dr16_specobj USING btree (plate);


--
-- Name: dr18_sdss_dr16_specobj_run2d_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_sdss_dr16_specobj_run2d_idx ON minidb.dr18_sdss_dr16_specobj USING btree (run2d);


--
-- Name: dr18_sdss_dr16_specobj_scienceprimary_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_sdss_dr16_specobj_scienceprimary_idx ON minidb.dr18_sdss_dr16_specobj USING btree (scienceprimary);


--
-- Name: dr18_sdss_dr16_specobj_snmedian_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_sdss_dr16_specobj_snmedian_idx ON minidb.dr18_sdss_dr16_specobj USING btree (snmedian);


--
-- Name: dr18_sdss_dr16_specobj_targetobjid_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_sdss_dr16_specobj_targetobjid_idx ON minidb.dr18_sdss_dr16_specobj USING btree (targetobjid);


--
-- Name: dr18_sdss_dr16_specobj_z_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_sdss_dr16_specobj_z_idx ON minidb.dr18_sdss_dr16_specobj USING btree (z);


--
-- Name: dr18_sdss_dr16_specobj_zerr_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_sdss_dr16_specobj_zerr_idx ON minidb.dr18_sdss_dr16_specobj USING btree (zerr);


--
-- Name: dr18_sdss_dr16_specobj_zwarning_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_sdss_dr16_specobj_zwarning_idx ON minidb.dr18_sdss_dr16_specobj USING btree (zwarning);


--
-- Name: dr18_skies_v2_down_pix_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_skies_v2_down_pix_idx ON minidb.dr18_skies_v2 USING btree (down_pix);


--
-- Name: dr18_skies_v2_mag_neighbour_gaia_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_skies_v2_mag_neighbour_gaia_idx ON minidb.dr18_skies_v2 USING btree (mag_neighbour_gaia);


--
-- Name: dr18_skies_v2_mag_neighbour_ls8_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_skies_v2_mag_neighbour_ls8_idx ON minidb.dr18_skies_v2 USING btree (mag_neighbour_ls8);


--
-- Name: dr18_skies_v2_mag_neighbour_ps1dr2_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_skies_v2_mag_neighbour_ps1dr2_idx ON minidb.dr18_skies_v2 USING btree (mag_neighbour_ps1dr2);


--
-- Name: dr18_skies_v2_mag_neighbour_tmass_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_skies_v2_mag_neighbour_tmass_idx ON minidb.dr18_skies_v2 USING btree (mag_neighbour_tmass);


--
-- Name: dr18_skies_v2_mag_neighbour_tycho2_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_skies_v2_mag_neighbour_tycho2_idx ON minidb.dr18_skies_v2 USING btree (mag_neighbour_tycho2);


--
-- Name: dr18_skies_v2_sep_neighbour_gaia_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_skies_v2_sep_neighbour_gaia_idx ON minidb.dr18_skies_v2 USING btree (sep_neighbour_gaia);


--
-- Name: dr18_skies_v2_sep_neighbour_ls8_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_skies_v2_sep_neighbour_ls8_idx ON minidb.dr18_skies_v2 USING btree (sep_neighbour_ls8);


--
-- Name: dr18_skies_v2_sep_neighbour_ps1dr2_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_skies_v2_sep_neighbour_ps1dr2_idx ON minidb.dr18_skies_v2 USING btree (sep_neighbour_ps1dr2);


--
-- Name: dr18_skies_v2_sep_neighbour_tmass_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_skies_v2_sep_neighbour_tmass_idx ON minidb.dr18_skies_v2 USING btree (sep_neighbour_tmass);


--
-- Name: dr18_skies_v2_sep_neighbour_tmass_xsc_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_skies_v2_sep_neighbour_tmass_xsc_idx ON minidb.dr18_skies_v2 USING btree (sep_neighbour_tmass_xsc);


--
-- Name: dr18_skies_v2_sep_neighbour_tycho2_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_skies_v2_sep_neighbour_tycho2_idx ON minidb.dr18_skies_v2 USING btree (sep_neighbour_tycho2);


--
-- Name: dr18_skies_v2_tile_32_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_skies_v2_tile_32_idx ON minidb.dr18_skies_v2 USING btree (tile_32);


--
-- Name: dr18_skymapper_dr2_allwise_cntr_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_skymapper_dr2_allwise_cntr_idx ON minidb.dr18_skymapper_dr2 USING btree (allwise_cntr);


--
-- Name: dr18_skymapper_dr2_flags_psf_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_skymapper_dr2_flags_psf_idx ON minidb.dr18_skymapper_dr2 USING btree (flags_psf);


--
-- Name: dr18_skymapper_dr2_g_psf_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_skymapper_dr2_g_psf_idx ON minidb.dr18_skymapper_dr2 USING btree (g_psf);


--
-- Name: dr18_skymapper_dr2_gaia_dr2_id1_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_skymapper_dr2_gaia_dr2_id1_idx ON minidb.dr18_skymapper_dr2 USING btree (gaia_dr2_id1);


--
-- Name: dr18_skymapper_dr2_gaia_dr2_id2_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_skymapper_dr2_gaia_dr2_id2_idx ON minidb.dr18_skymapper_dr2 USING btree (gaia_dr2_id2);


--
-- Name: dr18_skymapper_dr2_i_psf_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_skymapper_dr2_i_psf_idx ON minidb.dr18_skymapper_dr2 USING btree (i_psf);


--
-- Name: dr18_skymapper_dr2_nimaflags_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_skymapper_dr2_nimaflags_idx ON minidb.dr18_skymapper_dr2 USING btree (nimaflags);


--
-- Name: dr18_skymapper_dr2_r_psf_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_skymapper_dr2_r_psf_idx ON minidb.dr18_skymapper_dr2 USING btree (r_psf);


--
-- Name: dr18_skymapper_dr2_smss_j_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_skymapper_dr2_smss_j_idx ON minidb.dr18_skymapper_dr2 USING btree (smss_j);


--
-- Name: dr18_skymapper_dr2_z_psf_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_skymapper_dr2_z_psf_idx ON minidb.dr18_skymapper_dr2 USING btree (z_psf);


--
-- Name: dr18_supercosmos_classb_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_supercosmos_classb_idx ON minidb.dr18_supercosmos USING btree (classb);


--
-- Name: dr18_supercosmos_classi_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_supercosmos_classi_idx ON minidb.dr18_supercosmos USING btree (classi);


--
-- Name: dr18_supercosmos_classmagb_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_supercosmos_classmagb_idx ON minidb.dr18_supercosmos USING btree (classmagb);


--
-- Name: dr18_supercosmos_classmagi_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_supercosmos_classmagi_idx ON minidb.dr18_supercosmos USING btree (classmagi);


--
-- Name: dr18_supercosmos_classmagr1_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_supercosmos_classmagr1_idx ON minidb.dr18_supercosmos USING btree (classmagr1);


--
-- Name: dr18_supercosmos_classmagr2_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_supercosmos_classmagr2_idx ON minidb.dr18_supercosmos USING btree (classmagr2);


--
-- Name: dr18_supercosmos_classr1_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_supercosmos_classr1_idx ON minidb.dr18_supercosmos USING btree (classr1);


--
-- Name: dr18_supercosmos_classr2_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_supercosmos_classr2_idx ON minidb.dr18_supercosmos USING btree (classr2);


--
-- Name: dr18_target_catalogid_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_target_catalogid_idx ON minidb.dr18_target USING btree (catalogid);


--
-- Name: dr18_target_q3c_ang2ipix_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_target_q3c_ang2ipix_idx ON minidb.dr18_target USING btree (public.q3c_ang2ipix(ra, "dec"));


--
-- Name: dr18_targetdb_version_plan_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE UNIQUE INDEX dr18_targetdb_version_plan_idx ON minidb.dr18_targetdb_version USING btree (plan);


--
-- Name: dr18_targeting_generation_label_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE UNIQUE INDEX dr18_targeting_generation_label_idx ON minidb.dr18_targeting_generation USING btree (label);


--
-- Name: dr18_tic_v8_allwise_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_tic_v8_allwise_idx ON minidb.dr18_tic_v8 USING btree (allwise);


--
-- Name: dr18_tic_v8_gaia_int_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_tic_v8_gaia_int_idx ON minidb.dr18_tic_v8 USING btree (gaia_int);


--
-- Name: dr18_tic_v8_gaiamag_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_tic_v8_gaiamag_idx ON minidb.dr18_tic_v8 USING btree (gaiamag);


--
-- Name: dr18_tic_v8_hmag_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_tic_v8_hmag_idx ON minidb.dr18_tic_v8 USING btree (hmag);


--
-- Name: dr18_tic_v8_kic_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_tic_v8_kic_idx ON minidb.dr18_tic_v8 USING btree (kic);


--
-- Name: dr18_tic_v8_logg_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_tic_v8_logg_idx ON minidb.dr18_tic_v8 USING btree (logg);


--
-- Name: dr18_tic_v8_objtype_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_tic_v8_objtype_idx ON minidb.dr18_tic_v8 USING btree (objtype);


--
-- Name: dr18_tic_v8_plx_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_tic_v8_plx_idx ON minidb.dr18_tic_v8 USING btree (plx);


--
-- Name: dr18_tic_v8_posflag_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_tic_v8_posflag_idx ON minidb.dr18_tic_v8 USING btree (posflag);


--
-- Name: dr18_tic_v8_sdss_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_tic_v8_sdss_idx ON minidb.dr18_tic_v8 USING btree (sdss);


--
-- Name: dr18_tic_v8_teff_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_tic_v8_teff_idx ON minidb.dr18_tic_v8 USING btree (teff);


--
-- Name: dr18_tic_v8_tmag_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_tic_v8_tmag_idx ON minidb.dr18_tic_v8 USING btree (tmag);


--
-- Name: dr18_tic_v8_twomass_psc_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_tic_v8_twomass_psc_idx ON minidb.dr18_tic_v8 USING btree (twomass_psc);


--
-- Name: dr18_tic_v8_twomass_psc_pts_key_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_tic_v8_twomass_psc_pts_key_idx ON minidb.dr18_tic_v8 USING btree (twomass_psc_pts_key);


--
-- Name: dr18_tic_v8_tycho2_tycid_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_tic_v8_tycho2_tycid_idx ON minidb.dr18_tic_v8 USING btree (tycho2_tycid);


--
-- Name: dr18_twomass_psc_cc_flg_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_twomass_psc_cc_flg_idx ON minidb.dr18_twomass_psc USING btree (cc_flg);


--
-- Name: dr18_twomass_psc_designation_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE UNIQUE INDEX dr18_twomass_psc_designation_idx ON minidb.dr18_twomass_psc USING btree (designation);


--
-- Name: dr18_twomass_psc_designation_idx1; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_twomass_psc_designation_idx1 ON minidb.dr18_twomass_psc USING btree (designation);


--
-- Name: dr18_twomass_psc_gal_contam_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_twomass_psc_gal_contam_idx ON minidb.dr18_twomass_psc USING btree (gal_contam);


--
-- Name: dr18_twomass_psc_jdate_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_twomass_psc_jdate_idx ON minidb.dr18_twomass_psc USING btree (jdate);


--
-- Name: dr18_twomass_psc_ph_qual_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_twomass_psc_ph_qual_idx ON minidb.dr18_twomass_psc USING btree (ph_qual);


--
-- Name: dr18_twomass_psc_rd_flg_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_twomass_psc_rd_flg_idx ON minidb.dr18_twomass_psc USING btree (rd_flg);


--
-- Name: dr18_tycho2_btmag_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_tycho2_btmag_idx ON minidb.dr18_tycho2 USING btree (btmag);


--
-- Name: dr18_tycho2_tycid_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_tycho2_tycid_idx ON minidb.dr18_tycho2 USING btree (tycid);


--
-- Name: dr18_tycho2_vtmag_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_tycho2_vtmag_idx ON minidb.dr18_tycho2 USING btree (vtmag);


--
-- Name: dr18_uvotssc1_name_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_uvotssc1_name_idx ON minidb.dr18_uvotssc1 USING btree (name);


--
-- Name: dr18_uvotssc1_obsid_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_uvotssc1_obsid_idx ON minidb.dr18_uvotssc1 USING btree (obsid);


--
-- Name: dr18_uvotssc1_srcid_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_uvotssc1_srcid_idx ON minidb.dr18_uvotssc1 USING btree (srcid);


--
-- Name: dr18_xmm_om_suss_4_1_iauname_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_xmm_om_suss_4_1_iauname_idx ON minidb.dr18_xmm_om_suss_4_1 USING btree (iauname);


--
-- Name: dr18_yso_clustering_bp_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_yso_clustering_bp_idx ON minidb.dr18_yso_clustering USING btree (bp);


--
-- Name: dr18_yso_clustering_g_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_yso_clustering_g_idx ON minidb.dr18_yso_clustering USING btree (g);


--
-- Name: dr18_yso_clustering_h_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_yso_clustering_h_idx ON minidb.dr18_yso_clustering USING btree (h);


--
-- Name: dr18_yso_clustering_j_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_yso_clustering_j_idx ON minidb.dr18_yso_clustering USING btree (j);


--
-- Name: dr18_yso_clustering_k_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_yso_clustering_k_idx ON minidb.dr18_yso_clustering USING btree (k);


--
-- Name: dr18_yso_clustering_rp_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_yso_clustering_rp_idx ON minidb.dr18_yso_clustering USING btree (rp);


--
-- Name: dr18_zari18pms_bp_over_rp_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_zari18pms_bp_over_rp_idx ON minidb.dr18_zari18pms USING btree (bp_over_rp);


--
-- Name: dr18_zari18pms_bp_rp_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_zari18pms_bp_rp_idx ON minidb.dr18_zari18pms USING btree (bp_rp);


--
-- Name: dr18_zari18pms_bpmag_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_zari18pms_bpmag_idx ON minidb.dr18_zari18pms USING btree (bpmag);


--
-- Name: dr18_zari18pms_gmag_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_zari18pms_gmag_idx ON minidb.dr18_zari18pms USING btree (gmag);


--
-- Name: dr18_zari18pms_rpmag_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_zari18pms_rpmag_idx ON minidb.dr18_zari18pms USING btree (rpmag);


--
-- Name: dr18_zari18pms_source_idx; Type: INDEX; Schema: minidb; Owner: -
--

CREATE INDEX dr18_zari18pms_source_idx ON minidb.dr18_zari18pms USING btree (source);


--
-- Name: dr18_best_brightest dr18_best_brightest_cntr_fkey; Type: FK CONSTRAINT; Schema: minidb; Owner: -
--

ALTER TABLE ONLY minidb.dr18_best_brightest
    ADD CONSTRAINT dr18_best_brightest_cntr_fkey FOREIGN KEY (cntr) REFERENCES minidb.dr18_allwise(cntr);


--
-- Name: dr18_bhm_csc_v2 dr18_bhm_csc_v2_designation2m_fkey; Type: FK CONSTRAINT; Schema: minidb; Owner: -
--

ALTER TABLE ONLY minidb.dr18_bhm_csc_v2
    ADD CONSTRAINT dr18_bhm_csc_v2_designation2m_fkey FOREIGN KEY (designation2m) REFERENCES minidb.dr18_twomass_psc(designation);


--
-- Name: dr18_bhm_csc_v2 dr18_bhm_csc_v2_idg2_fkey; Type: FK CONSTRAINT; Schema: minidb; Owner: -
--

ALTER TABLE ONLY minidb.dr18_bhm_csc_v2
    ADD CONSTRAINT dr18_bhm_csc_v2_idg2_fkey FOREIGN KEY (idg2) REFERENCES minidb.dr18_gaia_dr2_source(source_id);


--
-- Name: dr18_carton dr18_carton_target_selection_plan_fkey; Type: FK CONSTRAINT; Schema: minidb; Owner: -
--

ALTER TABLE ONLY minidb.dr18_carton
    ADD CONSTRAINT dr18_carton_target_selection_plan_fkey FOREIGN KEY (target_selection_plan) REFERENCES minidb.dr18_targetdb_version(plan);


--
-- Name: dr18_cataclysmic_variables dr18_cataclysmic_variables_source_id_fkey; Type: FK CONSTRAINT; Schema: minidb; Owner: -
--

ALTER TABLE ONLY minidb.dr18_cataclysmic_variables
    ADD CONSTRAINT dr18_cataclysmic_variables_source_id_fkey FOREIGN KEY (source_id) REFERENCES minidb.dr18_gaia_dr2_source(source_id);


--
-- Name: dr18_catalog_to_allwise dr18_catalog_to_allwise_target_id_fkey; Type: FK CONSTRAINT; Schema: minidb; Owner: -
--

ALTER TABLE ONLY minidb.dr18_catalog_to_allwise
    ADD CONSTRAINT dr18_catalog_to_allwise_target_id_fkey FOREIGN KEY (target_id) REFERENCES minidb.dr18_allwise(cntr);


--
-- Name: dr18_catalog_to_bhm_efeds_veto dr18_catalog_to_bhm_efeds_veto_target_id_fkey; Type: FK CONSTRAINT; Schema: minidb; Owner: -
--

ALTER TABLE ONLY minidb.dr18_catalog_to_bhm_efeds_veto
    ADD CONSTRAINT dr18_catalog_to_bhm_efeds_veto_target_id_fkey FOREIGN KEY (target_id) REFERENCES minidb.dr18_bhm_efeds_veto(pk);


--
-- Name: dr18_catalog_to_bhm_rm_v0_2 dr18_catalog_to_bhm_rm_v0_2_target_id_fkey; Type: FK CONSTRAINT; Schema: minidb; Owner: -
--

ALTER TABLE ONLY minidb.dr18_catalog_to_bhm_rm_v0_2
    ADD CONSTRAINT dr18_catalog_to_bhm_rm_v0_2_target_id_fkey FOREIGN KEY (target_id) REFERENCES minidb.dr18_bhm_rm_v0_2(pk);


--
-- Name: dr18_catalog_to_catwise2020 dr18_catalog_to_catwise2020_target_id_fkey; Type: FK CONSTRAINT; Schema: minidb; Owner: -
--

ALTER TABLE ONLY minidb.dr18_catalog_to_catwise2020
    ADD CONSTRAINT dr18_catalog_to_catwise2020_target_id_fkey FOREIGN KEY (target_id) REFERENCES minidb.dr18_catwise2020(source_id);


--
-- Name: dr18_catalog_to_glimpse dr18_catalog_to_glimpse_target_id_fkey; Type: FK CONSTRAINT; Schema: minidb; Owner: -
--

ALTER TABLE ONLY minidb.dr18_catalog_to_glimpse
    ADD CONSTRAINT dr18_catalog_to_glimpse_target_id_fkey FOREIGN KEY (target_id) REFERENCES minidb.dr18_glimpse(pk);


--
-- Name: dr18_catalog_to_guvcat dr18_catalog_to_guvcat_target_id_fkey; Type: FK CONSTRAINT; Schema: minidb; Owner: -
--

ALTER TABLE ONLY minidb.dr18_catalog_to_guvcat
    ADD CONSTRAINT dr18_catalog_to_guvcat_target_id_fkey FOREIGN KEY (target_id) REFERENCES minidb.dr18_guvcat(objid);


--
-- Name: dr18_catalog_to_legacy_survey_dr8 dr18_catalog_to_legacy_survey_dr8_target_id_fkey; Type: FK CONSTRAINT; Schema: minidb; Owner: -
--

ALTER TABLE ONLY minidb.dr18_catalog_to_legacy_survey_dr8
    ADD CONSTRAINT dr18_catalog_to_legacy_survey_dr8_target_id_fkey FOREIGN KEY (target_id) REFERENCES minidb.dr18_legacy_survey_dr8(ls_id);


--
-- Name: dr18_catalog_to_panstarrs1 dr18_catalog_to_panstarrs1_target_id_fkey; Type: FK CONSTRAINT; Schema: minidb; Owner: -
--

ALTER TABLE ONLY minidb.dr18_catalog_to_panstarrs1
    ADD CONSTRAINT dr18_catalog_to_panstarrs1_target_id_fkey FOREIGN KEY (target_id) REFERENCES minidb.dr18_panstarrs1(catid_objid);


--
-- Name: dr18_catalog_to_sdss_dr13_photoobj_primary dr18_catalog_to_sdss_dr13_photoobj_primary_target_id_fkey; Type: FK CONSTRAINT; Schema: minidb; Owner: -
--

ALTER TABLE ONLY minidb.dr18_catalog_to_sdss_dr13_photoobj_primary
    ADD CONSTRAINT dr18_catalog_to_sdss_dr13_photoobj_primary_target_id_fkey FOREIGN KEY (target_id) REFERENCES minidb.dr18_sdss_dr13_photoobj_primary(objid);


--
-- Name: dr18_catalog_to_sdss_dr16_specobj dr18_catalog_to_sdss_dr16_specobj_target_id_fkey; Type: FK CONSTRAINT; Schema: minidb; Owner: -
--

ALTER TABLE ONLY minidb.dr18_catalog_to_sdss_dr16_specobj
    ADD CONSTRAINT dr18_catalog_to_sdss_dr16_specobj_target_id_fkey FOREIGN KEY (target_id) REFERENCES minidb.dr18_sdss_dr16_specobj(specobjid);


--
-- Name: dr18_catalog_to_skies_v2 dr18_catalog_to_skies_v2_target_id_fkey; Type: FK CONSTRAINT; Schema: minidb; Owner: -
--

ALTER TABLE ONLY minidb.dr18_catalog_to_skies_v2
    ADD CONSTRAINT dr18_catalog_to_skies_v2_target_id_fkey FOREIGN KEY (target_id) REFERENCES minidb.dr18_skies_v2(pix_32768);


--
-- Name: dr18_catalog_to_skymapper_dr2 dr18_catalog_to_skymapper_dr2_target_id_fkey; Type: FK CONSTRAINT; Schema: minidb; Owner: -
--

ALTER TABLE ONLY minidb.dr18_catalog_to_skymapper_dr2
    ADD CONSTRAINT dr18_catalog_to_skymapper_dr2_target_id_fkey FOREIGN KEY (target_id) REFERENCES minidb.dr18_skymapper_dr2(object_id);


--
-- Name: dr18_catalog_to_supercosmos dr18_catalog_to_supercosmos_target_id_fkey; Type: FK CONSTRAINT; Schema: minidb; Owner: -
--

ALTER TABLE ONLY minidb.dr18_catalog_to_supercosmos
    ADD CONSTRAINT dr18_catalog_to_supercosmos_target_id_fkey FOREIGN KEY (target_id) REFERENCES minidb.dr18_supercosmos(objid);


--
-- Name: dr18_catalog_to_tic_v8 dr18_catalog_to_tic_v8_target_id_fkey; Type: FK CONSTRAINT; Schema: minidb; Owner: -
--

ALTER TABLE ONLY minidb.dr18_catalog_to_tic_v8
    ADD CONSTRAINT dr18_catalog_to_tic_v8_target_id_fkey FOREIGN KEY (target_id) REFERENCES minidb.dr18_tic_v8(id);


--
-- Name: dr18_catalog_to_tycho2 dr18_catalog_to_tycho2_target_id_fkey; Type: FK CONSTRAINT; Schema: minidb; Owner: -
--

ALTER TABLE ONLY minidb.dr18_catalog_to_tycho2
    ADD CONSTRAINT dr18_catalog_to_tycho2_target_id_fkey FOREIGN KEY (target_id) REFERENCES minidb.dr18_tycho2(designation);


--
-- Name: dr18_catalog_to_uvotssc1 dr18_catalog_to_uvotssc1_target_id_fkey; Type: FK CONSTRAINT; Schema: minidb; Owner: -
--

ALTER TABLE ONLY minidb.dr18_catalog_to_uvotssc1
    ADD CONSTRAINT dr18_catalog_to_uvotssc1_target_id_fkey FOREIGN KEY (target_id) REFERENCES minidb.dr18_uvotssc1(id);


--
-- Name: dr18_catalog_to_xmm_om_suss_4_1 dr18_catalog_to_xmm_om_suss_4_1_target_id_fkey; Type: FK CONSTRAINT; Schema: minidb; Owner: -
--

ALTER TABLE ONLY minidb.dr18_catalog_to_xmm_om_suss_4_1
    ADD CONSTRAINT dr18_catalog_to_xmm_om_suss_4_1_target_id_fkey FOREIGN KEY (target_id) REFERENCES minidb.dr18_xmm_om_suss_4_1(pk);


--
-- Name: dr18_ebosstarget_v5 dr18_ebosstarget_v5_objid_targeting_fkey; Type: FK CONSTRAINT; Schema: minidb; Owner: -
--

ALTER TABLE ONLY minidb.dr18_ebosstarget_v5
    ADD CONSTRAINT dr18_ebosstarget_v5_objid_targeting_fkey FOREIGN KEY (objid_targeting) REFERENCES minidb.dr18_sdss_dr13_photoobj_primary(objid);


--
-- Name: dr18_gaia_dr2_ruwe dr18_gaia_dr2_ruwe_source_id_fkey; Type: FK CONSTRAINT; Schema: minidb; Owner: -
--

ALTER TABLE ONLY minidb.dr18_gaia_dr2_ruwe
    ADD CONSTRAINT dr18_gaia_dr2_ruwe_source_id_fkey FOREIGN KEY (source_id) REFERENCES minidb.dr18_gaia_dr2_source(source_id);


--
-- Name: dr18_gaia_dr2_wd dr18_gaia_dr2_wd_source_id_fkey; Type: FK CONSTRAINT; Schema: minidb; Owner: -
--

ALTER TABLE ONLY minidb.dr18_gaia_dr2_wd
    ADD CONSTRAINT dr18_gaia_dr2_wd_source_id_fkey FOREIGN KEY (source_id) REFERENCES minidb.dr18_gaia_dr2_source(source_id);


--
-- Name: dr18_gaia_unwise_agn dr18_gaia_unwise_agn_gaia_sourceid_fkey; Type: FK CONSTRAINT; Schema: minidb; Owner: -
--

ALTER TABLE ONLY minidb.dr18_gaia_unwise_agn
    ADD CONSTRAINT dr18_gaia_unwise_agn_gaia_sourceid_fkey FOREIGN KEY (gaia_sourceid) REFERENCES minidb.dr18_gaia_dr2_source(source_id);


--
-- Name: dr18_gaiadr2_tmass_best_neighbour dr18_gaiadr2_tmass_best_neighbour_source_id_fkey; Type: FK CONSTRAINT; Schema: minidb; Owner: -
--

ALTER TABLE ONLY minidb.dr18_gaiadr2_tmass_best_neighbour
    ADD CONSTRAINT dr18_gaiadr2_tmass_best_neighbour_source_id_fkey FOREIGN KEY (source_id) REFERENCES minidb.dr18_gaia_dr2_source(source_id);


--
-- Name: dr18_gaiadr2_tmass_best_neighbour dr18_gaiadr2_tmass_best_neighbour_tmass_pts_key_fkey; Type: FK CONSTRAINT; Schema: minidb; Owner: -
--

ALTER TABLE ONLY minidb.dr18_gaiadr2_tmass_best_neighbour
    ADD CONSTRAINT dr18_gaiadr2_tmass_best_neighbour_tmass_pts_key_fkey FOREIGN KEY (tmass_pts_key) REFERENCES minidb.dr18_twomass_psc(pts_key);


--
-- Name: dr18_geometric_distances_gaia_dr2 dr18_geometric_distances_gaia_dr2_source_id_fkey; Type: FK CONSTRAINT; Schema: minidb; Owner: -
--

ALTER TABLE ONLY minidb.dr18_geometric_distances_gaia_dr2
    ADD CONSTRAINT dr18_geometric_distances_gaia_dr2_source_id_fkey FOREIGN KEY (source_id) REFERENCES minidb.dr18_gaia_dr2_source(source_id);


--
-- Name: dr18_sagitta dr18_sagitta_source_id_fkey; Type: FK CONSTRAINT; Schema: minidb; Owner: -
--

ALTER TABLE ONLY minidb.dr18_sagitta
    ADD CONSTRAINT dr18_sagitta_source_id_fkey FOREIGN KEY (source_id) REFERENCES minidb.dr18_gaia_dr2_source(source_id);


--
-- Name: dr18_sdss_apogeeallstarmerge_r13 dr18_sdss_apogeeallstarmerge_r13_designation_fkey; Type: FK CONSTRAINT; Schema: minidb; Owner: -
--

ALTER TABLE ONLY minidb.dr18_sdss_apogeeallstarmerge_r13
    ADD CONSTRAINT dr18_sdss_apogeeallstarmerge_r13_designation_fkey FOREIGN KEY (designation) REFERENCES minidb.dr18_twomass_psc(designation);


--
-- Name: dr18_sdss_dr16_qso dr18_sdss_dr16_qso_plate_fiberid_mjd_fkey; Type: FK CONSTRAINT; Schema: minidb; Owner: -
--

ALTER TABLE ONLY minidb.dr18_sdss_dr16_qso
    ADD CONSTRAINT dr18_sdss_dr16_qso_plate_fiberid_mjd_fkey FOREIGN KEY (plate, fiberid, mjd) REFERENCES minidb.dr18_sdss_dr16_specobj(plate, fiberid, mjd);


--
-- Name: dr18_tic_v8 dr18_tic_v8_gaia_int_fkey; Type: FK CONSTRAINT; Schema: minidb; Owner: -
--

ALTER TABLE ONLY minidb.dr18_tic_v8
    ADD CONSTRAINT dr18_tic_v8_gaia_int_fkey FOREIGN KEY (gaia_int) REFERENCES minidb.dr18_gaia_dr2_source(source_id);


--
-- Name: dr18_tic_v8 dr18_tic_v8_twomass_psc_fkey; Type: FK CONSTRAINT; Schema: minidb; Owner: -
--

ALTER TABLE ONLY minidb.dr18_tic_v8
    ADD CONSTRAINT dr18_tic_v8_twomass_psc_fkey FOREIGN KEY (twomass_psc) REFERENCES minidb.dr18_twomass_psc(designation);


--
-- Name: dr18_yso_clustering dr18_yso_clustering_source_id_fkey; Type: FK CONSTRAINT; Schema: minidb; Owner: -
--

ALTER TABLE ONLY minidb.dr18_yso_clustering
    ADD CONSTRAINT dr18_yso_clustering_source_id_fkey FOREIGN KEY (source_id) REFERENCES minidb.dr18_gaia_dr2_source(source_id);


--
-- Name: dr18_zari18pms dr18_zari18pms_source_fkey; Type: FK CONSTRAINT; Schema: minidb; Owner: -
--

ALTER TABLE ONLY minidb.dr18_zari18pms
    ADD CONSTRAINT dr18_zari18pms_source_fkey FOREIGN KEY (source) REFERENCES minidb.dr18_gaia_dr2_source(source_id);


--
-- Name: SCHEMA minidb; Type: ACL; Schema: -; Owner: -
--

GRANT USAGE ON SCHEMA minidb TO sdss;
GRANT USAGE ON SCHEMA minidb TO sdss_user;


--
-- Name: TABLE dr18_allwise; Type: ACL; Schema: minidb; Owner: -
--

GRANT SELECT ON TABLE minidb.dr18_allwise TO sdss;
GRANT SELECT ON TABLE minidb.dr18_allwise TO sdss_user;


--
-- Name: TABLE dr18_best_brightest; Type: ACL; Schema: minidb; Owner: -
--

GRANT SELECT ON TABLE minidb.dr18_best_brightest TO sdss;
GRANT SELECT ON TABLE minidb.dr18_best_brightest TO sdss_user;


--
-- Name: TABLE dr18_bhm_csc_v2; Type: ACL; Schema: minidb; Owner: -
--

GRANT SELECT ON TABLE minidb.dr18_bhm_csc_v2 TO sdss;
GRANT SELECT ON TABLE minidb.dr18_bhm_csc_v2 TO sdss_user;


--
-- Name: TABLE dr18_bhm_efeds_veto; Type: ACL; Schema: minidb; Owner: -
--

GRANT SELECT ON TABLE minidb.dr18_bhm_efeds_veto TO sdss;
GRANT SELECT ON TABLE minidb.dr18_bhm_efeds_veto TO sdss_user;


--
-- Name: TABLE dr18_bhm_rm_v0_2; Type: ACL; Schema: minidb; Owner: -
--

GRANT SELECT ON TABLE minidb.dr18_bhm_rm_v0_2 TO sdss;
GRANT SELECT ON TABLE minidb.dr18_bhm_rm_v0_2 TO sdss_user;


--
-- Name: TABLE dr18_cadence; Type: ACL; Schema: minidb; Owner: -
--

GRANT SELECT ON TABLE minidb.dr18_cadence TO sdss;
GRANT SELECT ON TABLE minidb.dr18_cadence TO sdss_user;


--
-- Name: TABLE dr18_cadence_epoch; Type: ACL; Schema: minidb; Owner: -
--

GRANT SELECT ON TABLE minidb.dr18_cadence_epoch TO sdss;
GRANT SELECT ON TABLE minidb.dr18_cadence_epoch TO sdss_user;


--
-- Name: TABLE dr18_carton; Type: ACL; Schema: minidb; Owner: -
--

GRANT SELECT ON TABLE minidb.dr18_carton TO sdss;
GRANT SELECT ON TABLE minidb.dr18_carton TO sdss_user;


--
-- Name: TABLE dr18_carton_to_target; Type: ACL; Schema: minidb; Owner: -
--

GRANT SELECT ON TABLE minidb.dr18_carton_to_target TO sdss;
GRANT SELECT ON TABLE minidb.dr18_carton_to_target TO sdss_user;


--
-- Name: TABLE dr18_carton_txt; Type: ACL; Schema: minidb; Owner: -
--

GRANT SELECT ON TABLE minidb.dr18_carton_txt TO sdss;
GRANT SELECT ON TABLE minidb.dr18_carton_txt TO sdss_user;


--
-- Name: TABLE dr18_cataclysmic_variables; Type: ACL; Schema: minidb; Owner: -
--

GRANT SELECT ON TABLE minidb.dr18_cataclysmic_variables TO sdss;
GRANT SELECT ON TABLE minidb.dr18_cataclysmic_variables TO sdss_user;


--
-- Name: TABLE dr18_catalog; Type: ACL; Schema: minidb; Owner: -
--

GRANT SELECT ON TABLE minidb.dr18_catalog TO sdss;
GRANT SELECT ON TABLE minidb.dr18_catalog TO sdss_user;


--
-- Name: TABLE dr18_catalog_to_allwise; Type: ACL; Schema: minidb; Owner: -
--

GRANT SELECT ON TABLE minidb.dr18_catalog_to_allwise TO sdss;
GRANT SELECT ON TABLE minidb.dr18_catalog_to_allwise TO sdss_user;


--
-- Name: TABLE dr18_catalog_to_bhm_efeds_veto; Type: ACL; Schema: minidb; Owner: -
--

GRANT SELECT ON TABLE minidb.dr18_catalog_to_bhm_efeds_veto TO sdss;
GRANT SELECT ON TABLE minidb.dr18_catalog_to_bhm_efeds_veto TO sdss_user;


--
-- Name: TABLE dr18_catalog_to_bhm_rm_v0_2; Type: ACL; Schema: minidb; Owner: -
--

GRANT SELECT ON TABLE minidb.dr18_catalog_to_bhm_rm_v0_2 TO sdss;
GRANT SELECT ON TABLE minidb.dr18_catalog_to_bhm_rm_v0_2 TO sdss_user;


--
-- Name: TABLE dr18_catalog_to_catwise2020; Type: ACL; Schema: minidb; Owner: -
--

GRANT SELECT ON TABLE minidb.dr18_catalog_to_catwise2020 TO sdss;
GRANT SELECT ON TABLE minidb.dr18_catalog_to_catwise2020 TO sdss_user;


--
-- Name: TABLE dr18_catalog_to_glimpse; Type: ACL; Schema: minidb; Owner: -
--

GRANT SELECT ON TABLE minidb.dr18_catalog_to_glimpse TO sdss;
GRANT SELECT ON TABLE minidb.dr18_catalog_to_glimpse TO sdss_user;


--
-- Name: TABLE dr18_catalog_to_guvcat; Type: ACL; Schema: minidb; Owner: -
--

GRANT SELECT ON TABLE minidb.dr18_catalog_to_guvcat TO sdss;
GRANT SELECT ON TABLE minidb.dr18_catalog_to_guvcat TO sdss_user;


--
-- Name: TABLE dr18_catalog_to_legacy_survey_dr8; Type: ACL; Schema: minidb; Owner: -
--

GRANT SELECT ON TABLE minidb.dr18_catalog_to_legacy_survey_dr8 TO sdss;
GRANT SELECT ON TABLE minidb.dr18_catalog_to_legacy_survey_dr8 TO sdss_user;


--
-- Name: TABLE dr18_catalog_to_panstarrs1; Type: ACL; Schema: minidb; Owner: -
--

GRANT SELECT ON TABLE minidb.dr18_catalog_to_panstarrs1 TO sdss;
GRANT SELECT ON TABLE minidb.dr18_catalog_to_panstarrs1 TO sdss_user;


--
-- Name: TABLE dr18_catalog_to_sdss_dr13_photoobj_primary; Type: ACL; Schema: minidb; Owner: -
--

GRANT SELECT ON TABLE minidb.dr18_catalog_to_sdss_dr13_photoobj_primary TO sdss;
GRANT SELECT ON TABLE minidb.dr18_catalog_to_sdss_dr13_photoobj_primary TO sdss_user;


--
-- Name: TABLE dr18_catalog_to_sdss_dr16_specobj; Type: ACL; Schema: minidb; Owner: -
--

GRANT SELECT ON TABLE minidb.dr18_catalog_to_sdss_dr16_specobj TO sdss;
GRANT SELECT ON TABLE minidb.dr18_catalog_to_sdss_dr16_specobj TO sdss_user;


--
-- Name: TABLE dr18_catalog_to_skies_v2; Type: ACL; Schema: minidb; Owner: -
--

GRANT SELECT ON TABLE minidb.dr18_catalog_to_skies_v2 TO sdss;
GRANT SELECT ON TABLE minidb.dr18_catalog_to_skies_v2 TO sdss_user;


--
-- Name: TABLE dr18_catalog_to_skymapper_dr2; Type: ACL; Schema: minidb; Owner: -
--

GRANT SELECT ON TABLE minidb.dr18_catalog_to_skymapper_dr2 TO sdss;
GRANT SELECT ON TABLE minidb.dr18_catalog_to_skymapper_dr2 TO sdss_user;


--
-- Name: TABLE dr18_catalog_to_supercosmos; Type: ACL; Schema: minidb; Owner: -
--

GRANT SELECT ON TABLE minidb.dr18_catalog_to_supercosmos TO sdss;
GRANT SELECT ON TABLE minidb.dr18_catalog_to_supercosmos TO sdss_user;


--
-- Name: TABLE dr18_catalog_to_tic_v8; Type: ACL; Schema: minidb; Owner: -
--

GRANT SELECT ON TABLE minidb.dr18_catalog_to_tic_v8 TO sdss;
GRANT SELECT ON TABLE minidb.dr18_catalog_to_tic_v8 TO sdss_user;


--
-- Name: TABLE dr18_catalog_to_tycho2; Type: ACL; Schema: minidb; Owner: -
--

GRANT SELECT ON TABLE minidb.dr18_catalog_to_tycho2 TO sdss;
GRANT SELECT ON TABLE minidb.dr18_catalog_to_tycho2 TO sdss_user;


--
-- Name: TABLE dr18_catalog_to_uvotssc1; Type: ACL; Schema: minidb; Owner: -
--

GRANT SELECT ON TABLE minidb.dr18_catalog_to_uvotssc1 TO sdss;
GRANT SELECT ON TABLE minidb.dr18_catalog_to_uvotssc1 TO sdss_user;


--
-- Name: TABLE dr18_catalog_to_xmm_om_suss_4_1; Type: ACL; Schema: minidb; Owner: -
--

GRANT SELECT ON TABLE minidb.dr18_catalog_to_xmm_om_suss_4_1 TO sdss;
GRANT SELECT ON TABLE minidb.dr18_catalog_to_xmm_om_suss_4_1 TO sdss_user;


--
-- Name: TABLE dr18_catalogdb_version; Type: ACL; Schema: minidb; Owner: -
--

GRANT SELECT ON TABLE minidb.dr18_catalogdb_version TO sdss;
GRANT SELECT ON TABLE minidb.dr18_catalogdb_version TO sdss_user;


--
-- Name: TABLE dr18_category; Type: ACL; Schema: minidb; Owner: -
--

GRANT SELECT ON TABLE minidb.dr18_category TO sdss;
GRANT SELECT ON TABLE minidb.dr18_category TO sdss_user;


--
-- Name: TABLE dr18_catwise2020; Type: ACL; Schema: minidb; Owner: -
--

GRANT SELECT ON TABLE minidb.dr18_catwise2020 TO sdss;
GRANT SELECT ON TABLE minidb.dr18_catwise2020 TO sdss_user;


--
-- Name: TABLE dr18_ebosstarget_v5; Type: ACL; Schema: minidb; Owner: -
--

GRANT SELECT ON TABLE minidb.dr18_ebosstarget_v5 TO sdss;
GRANT SELECT ON TABLE minidb.dr18_ebosstarget_v5 TO sdss_user;


--
-- Name: TABLE dr18_gaia_dr2_ruwe; Type: ACL; Schema: minidb; Owner: -
--

GRANT SELECT ON TABLE minidb.dr18_gaia_dr2_ruwe TO sdss;
GRANT SELECT ON TABLE minidb.dr18_gaia_dr2_ruwe TO sdss_user;


--
-- Name: TABLE dr18_gaia_dr2_source; Type: ACL; Schema: minidb; Owner: -
--

GRANT SELECT ON TABLE minidb.dr18_gaia_dr2_source TO sdss;
GRANT SELECT ON TABLE minidb.dr18_gaia_dr2_source TO sdss_user;


--
-- Name: TABLE dr18_gaia_dr2_wd; Type: ACL; Schema: minidb; Owner: -
--

GRANT SELECT ON TABLE minidb.dr18_gaia_dr2_wd TO sdss;
GRANT SELECT ON TABLE minidb.dr18_gaia_dr2_wd TO sdss_user;


--
-- Name: TABLE dr18_gaia_unwise_agn; Type: ACL; Schema: minidb; Owner: -
--

GRANT SELECT ON TABLE minidb.dr18_gaia_unwise_agn TO sdss;
GRANT SELECT ON TABLE minidb.dr18_gaia_unwise_agn TO sdss_user;


--
-- Name: TABLE dr18_gaiadr2_tmass_best_neighbour; Type: ACL; Schema: minidb; Owner: -
--

GRANT SELECT ON TABLE minidb.dr18_gaiadr2_tmass_best_neighbour TO sdss;
GRANT SELECT ON TABLE minidb.dr18_gaiadr2_tmass_best_neighbour TO sdss_user;


--
-- Name: TABLE dr18_geometric_distances_gaia_dr2; Type: ACL; Schema: minidb; Owner: -
--

GRANT SELECT ON TABLE minidb.dr18_geometric_distances_gaia_dr2 TO sdss;
GRANT SELECT ON TABLE minidb.dr18_geometric_distances_gaia_dr2 TO sdss_user;


--
-- Name: TABLE dr18_glimpse; Type: ACL; Schema: minidb; Owner: -
--

GRANT SELECT ON TABLE minidb.dr18_glimpse TO sdss;
GRANT SELECT ON TABLE minidb.dr18_glimpse TO sdss_user;


--
-- Name: TABLE dr18_guvcat; Type: ACL; Schema: minidb; Owner: -
--

GRANT SELECT ON TABLE minidb.dr18_guvcat TO sdss;
GRANT SELECT ON TABLE minidb.dr18_guvcat TO sdss_user;


--
-- Name: TABLE dr18_instrument; Type: ACL; Schema: minidb; Owner: -
--

GRANT SELECT ON TABLE minidb.dr18_instrument TO sdss;
GRANT SELECT ON TABLE minidb.dr18_instrument TO sdss_user;


--
-- Name: TABLE dr18_legacy_survey_dr8; Type: ACL; Schema: minidb; Owner: -
--

GRANT SELECT ON TABLE minidb.dr18_legacy_survey_dr8 TO sdss;
GRANT SELECT ON TABLE minidb.dr18_legacy_survey_dr8 TO sdss_user;


--
-- Name: TABLE dr18_magnitude; Type: ACL; Schema: minidb; Owner: -
--

GRANT SELECT ON TABLE minidb.dr18_magnitude TO sdss;
GRANT SELECT ON TABLE minidb.dr18_magnitude TO sdss_user;


--
-- Name: TABLE dr18_mapper; Type: ACL; Schema: minidb; Owner: -
--

GRANT SELECT ON TABLE minidb.dr18_mapper TO sdss;
GRANT SELECT ON TABLE minidb.dr18_mapper TO sdss_user;


--
-- Name: TABLE dr18_panstarrs1; Type: ACL; Schema: minidb; Owner: -
--

GRANT SELECT ON TABLE minidb.dr18_panstarrs1 TO sdss;
GRANT SELECT ON TABLE minidb.dr18_panstarrs1 TO sdss_user;


--
-- Name: TABLE dr18_sagitta; Type: ACL; Schema: minidb; Owner: -
--

GRANT SELECT ON TABLE minidb.dr18_sagitta TO sdss;
GRANT SELECT ON TABLE minidb.dr18_sagitta TO sdss_user;


--
-- Name: TABLE dr18_sdss_dr13_photoobj_primary; Type: ACL; Schema: minidb; Owner: -
--

GRANT SELECT ON TABLE minidb.dr18_sdss_dr13_photoobj_primary TO sdss;
GRANT SELECT ON TABLE minidb.dr18_sdss_dr13_photoobj_primary TO sdss_user;


--
-- Name: TABLE dr18_sdss_dr16_qso; Type: ACL; Schema: minidb; Owner: -
--

GRANT SELECT ON TABLE minidb.dr18_sdss_dr16_qso TO sdss;
GRANT SELECT ON TABLE minidb.dr18_sdss_dr16_qso TO sdss_user;


--
-- Name: TABLE dr18_sdss_dr16_qso_original; Type: ACL; Schema: minidb; Owner: -
--

GRANT SELECT ON TABLE minidb.dr18_sdss_dr16_qso_original TO sdss;
GRANT SELECT ON TABLE minidb.dr18_sdss_dr16_qso_original TO sdss_user;


--
-- Name: TABLE dr18_sdss_dr16_specobj; Type: ACL; Schema: minidb; Owner: -
--

GRANT SELECT ON TABLE minidb.dr18_sdss_dr16_specobj TO sdss;
GRANT SELECT ON TABLE minidb.dr18_sdss_dr16_specobj TO sdss_user;


--
-- Name: TABLE dr18_skies_v2; Type: ACL; Schema: minidb; Owner: -
--

GRANT SELECT ON TABLE minidb.dr18_skies_v2 TO sdss;
GRANT SELECT ON TABLE minidb.dr18_skies_v2 TO sdss_user;


--
-- Name: TABLE dr18_skymapper_dr2; Type: ACL; Schema: minidb; Owner: -
--

GRANT SELECT ON TABLE minidb.dr18_skymapper_dr2 TO sdss;
GRANT SELECT ON TABLE minidb.dr18_skymapper_dr2 TO sdss_user;


--
-- Name: TABLE dr18_supercosmos; Type: ACL; Schema: minidb; Owner: -
--

GRANT SELECT ON TABLE minidb.dr18_supercosmos TO sdss;
GRANT SELECT ON TABLE minidb.dr18_supercosmos TO sdss_user;


--
-- Name: TABLE dr18_target; Type: ACL; Schema: minidb; Owner: -
--

GRANT SELECT ON TABLE minidb.dr18_target TO sdss;
GRANT SELECT ON TABLE minidb.dr18_target TO sdss_user;


--
-- Name: TABLE dr18_targetdb_version; Type: ACL; Schema: minidb; Owner: -
--

GRANT SELECT ON TABLE minidb.dr18_targetdb_version TO sdss;
GRANT SELECT ON TABLE minidb.dr18_targetdb_version TO sdss_user;


--
-- Name: TABLE dr18_targeting_generation; Type: ACL; Schema: minidb; Owner: -
--

GRANT SELECT ON TABLE minidb.dr18_targeting_generation TO sdss;
GRANT SELECT ON TABLE minidb.dr18_targeting_generation TO sdss_user;


--
-- Name: SEQUENCE dr18_targeting_generation_pk_seq; Type: ACL; Schema: minidb; Owner: -
--

GRANT SELECT ON SEQUENCE minidb.dr18_targeting_generation_pk_seq TO sdss;
GRANT SELECT ON SEQUENCE minidb.dr18_targeting_generation_pk_seq TO sdss_user;


--
-- Name: TABLE dr18_tic_v8; Type: ACL; Schema: minidb; Owner: -
--

GRANT SELECT ON TABLE minidb.dr18_tic_v8 TO sdss;
GRANT SELECT ON TABLE minidb.dr18_tic_v8 TO sdss_user;


--
-- Name: TABLE dr18_twomass_psc; Type: ACL; Schema: minidb; Owner: -
--

GRANT SELECT ON TABLE minidb.dr18_twomass_psc TO sdss;
GRANT SELECT ON TABLE minidb.dr18_twomass_psc TO sdss_user;


--
-- Name: TABLE dr18_tycho2; Type: ACL; Schema: minidb; Owner: -
--

GRANT SELECT ON TABLE minidb.dr18_tycho2 TO sdss;
GRANT SELECT ON TABLE minidb.dr18_tycho2 TO sdss_user;


--
-- Name: TABLE dr18_uvotssc1; Type: ACL; Schema: minidb; Owner: -
--

GRANT SELECT ON TABLE minidb.dr18_uvotssc1 TO sdss;
GRANT SELECT ON TABLE minidb.dr18_uvotssc1 TO sdss_user;


--
-- Name: TABLE dr18_xmm_om_suss_4_1; Type: ACL; Schema: minidb; Owner: -
--

GRANT SELECT ON TABLE minidb.dr18_xmm_om_suss_4_1 TO sdss;
GRANT SELECT ON TABLE minidb.dr18_xmm_om_suss_4_1 TO sdss_user;


--
-- Name: TABLE dr18_yso_clustering; Type: ACL; Schema: minidb; Owner: -
--

GRANT SELECT ON TABLE minidb.dr18_yso_clustering TO sdss;
GRANT SELECT ON TABLE minidb.dr18_yso_clustering TO sdss_user;


--
-- Name: TABLE dr18_zari18pms; Type: ACL; Schema: minidb; Owner: -
--

GRANT SELECT ON TABLE minidb.dr18_zari18pms TO sdss;
GRANT SELECT ON TABLE minidb.dr18_zari18pms TO sdss_user;


--
-- PostgreSQL database dump complete
--

