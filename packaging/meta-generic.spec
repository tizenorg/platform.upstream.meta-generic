Summary:	Tizen Package Groups and Images Configurations
Name:		meta-generic
Version:	0
Release:	1
License:	GPL-2.0
Group:		Base/Configuration
URL:		http://www.tizen.org
Source:		%{name}-%{version}.tar.bz2
Source1001: 	meta-generic.manifest

%description
Tizen Package Groups and Image Configurations for Base OS

%prep
%setup -q
cp %{SOURCE1001} .

%build
make

%install
%make_install


%files
%manifest %{name}.manifest
%attr(644,-,-) %{_datadir}/package-groups/generic/*.yaml
%{_datadir}/image-configurations/generic/scripts

