{ stdenv, python2, fetchPypi
, fftw, alsaLib, pulseaudio, wxPython }:

python2.pkgs.buildPythonApplication rec {
  pname = "quisk";
  version = "4.1.66";

  src = fetchPypi {
    inherit pname version;
    sha256 = "6d1e32eca2979a30254f3cb0e277769b9b0325a4c42f4aa9f0eeb66dcb0f5ca9";
  };

  buildInputs = [ fftw alsaLib pulseaudio ];

  propagatedBuildInputs = [ wxPython ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "A Software Defined Radio (SDR) transceiver";
    longDescription = ''
      QUISK is a Software Defined Radio (SDR) transceiver. You supply radio 
      hardware that converts signals at the antenna to complex (I/Q) data at an 
      intermediate frequency (IF). Data can come from a sound card, Ethernet or 
      USB. Quisk then filters and demodulates the data and sends the audio to 
      your speakers or headphones. For transmit, Quisk takes the microphone 
      signal, converts it to I/Q data and sends it to the hardware.
      
      Quisk can be used with SoftRock, Hermes Lite 2, HiQSDR, Odyssey and many 
      radios that use the Hermes protocol. Quisk can connect to digital 
      programs like Fldigi and WSJT-X. Quisk can be connected to other software 
      like N1MM+ and software that uses Hamlib.
    '';
    license = licenses.gpl2;
    homepage = "https://james.ahlstrom.name/quisk/";
  };
}
