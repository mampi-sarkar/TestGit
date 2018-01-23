clc
clear all
close all
Z=double(hdfread('C:\Users\Mampi\Dropbox\CSET\Data\CloudSAT\Geoprof_current\2015200212411_49074_CS_2B-GEOPROF_GRANULE_P_R04_E06.hdf', '/2B-GEOPROF/Data Fields/Radar_Reflectivity'));
lat=hdfread('C:\Users\Mampi\Dropbox\CSET\Data\CloudSAT\Geoprof_current\2015200212411_49074_CS_2B-GEOPROF_GRANULE_P_R04_E06.hdf', '/2B-GEOPROF/Geolocation Fields/Latitude', 'Fields', 'Latitude');
factor = hdfread('C:\Users\Mampi\Dropbox\CSET\Data\CloudSAT\Geoprof_current\2015200212411_49074_CS_2B-GEOPROF_GRANULE_P_R04_E06.hdf', '/2B-GEOPROF/Swath Attributes/Latitude.factor', 'Fields', 'AttrValues', 'FirstRecord',1 ,'NumRecords',1);
offset = hdfread('C:\Users\Mampi\Dropbox\CSET\Data\CloudSAT\Geoprof_current\2015200212411_49074_CS_2B-GEOPROF_GRANULE_P_R04_E06.hdf', '/2B-GEOPROF/Swath Attributes/Latitude.offset', 'Fields', 'AttrValues', 'FirstRecord',1 ,'NumRecords',1);
range = hdfread('C:\Users\Mampi\Dropbox\CSET\Data\CloudSAT\Geoprof_current\2015200212411_49074_CS_2B-GEOPROF_GRANULE_P_R04_E06.hdf', '/2B-GEOPROF/Swath Attributes/Latitude.valid_range', 'Fields', 'AttrValues', 'FirstRecord',1 ,'NumRecords',1);
lat=lat{:};
factor=factor{:};
offset=offset{:};
range=range{:};
valid_min=single(range(1));
valid_max=single(range(2));
valid_max = valid_max/factor;
valid_min = valid_min/factor;
lat= lat/factor;
lat(lat>valid_max) = nan;
lat(lat<valid_min) = nan;
lon=hdfread('C:\Users\Mampi\Dropbox\CSET\Data\CloudSAT\Geoprof_current\2015200212411_49074_CS_2B-GEOPROF_GRANULE_P_R04_E06.hdf', '/2B-GEOPROF/Geolocation Fields/Longitude', 'Fields', 'Longitude');
factor = hdfread('C:\Users\Mampi\Dropbox\CSET\Data\CloudSAT\Geoprof_current\2015200212411_49074_CS_2B-GEOPROF_GRANULE_P_R04_E06.hdf', '/2B-GEOPROF/Swath Attributes/Longitude.factor', 'Fields', 'AttrValues', 'FirstRecord',1 ,'NumRecords',1);
offset = hdfread('C:\Users\Mampi\Dropbox\CSET\Data\CloudSAT\Geoprof_current\2015200212411_49074_CS_2B-GEOPROF_GRANULE_P_R04_E06.hdf', '/2B-GEOPROF/Swath Attributes/Longitude.offset', 'Fields', 'AttrValues', 'FirstRecord',1 ,'NumRecords',1);
range = hdfread('C:\Users\Mampi\Dropbox\CSET\Data\CloudSAT\Geoprof_current\2015200212411_49074_CS_2B-GEOPROF_GRANULE_P_R04_E06.hdf', '/2B-GEOPROF/Swath Attributes/Longitude.valid_range', 'Fields', 'AttrValues', 'FirstRecord',1 ,'NumRecords',1);
lon=lon{:};
factor=factor{:};
offset=offset{:};
range=range{:};
valid_min=single(range(1));
valid_max=single(range(2));
valid_max = valid_max/factor;
valid_min = valid_min/factor;
lon= lon/factor;
lon(lon>valid_max) = nan;
lon(lon<valid_min) = nan;

h=double(hdfread('C:\Users\Mampi\Dropbox\CSET\Data\CloudSAT\Geoprof_current\2015200212411_49074_CS_2B-GEOPROF_GRANULE_P_R04_E06.hdf', '/2B-GEOPROF/Geolocation Fields/Height'));
t=hdfread('C:\Users\Mampi\Dropbox\CSET\Data\CloudSAT\Geoprof_current\2015200212411_49074_CS_2B-GEOPROF_GRANULE_P_R04_E06.hdf', '/2B-GEOPROF/Geolocation Fields/Profile_time', 'Fields', 'Profile_time');
mask = hdfread('C:\Users\Mampi\Dropbox\CSET\Data\CloudSAT\Geoprof_current\2015200212411_49074_CS_2B-GEOPROF_GRANULE_P_R04_E06.hdf', '/2B-GEOPROF/Data Fields/CPR_Cloud_mask');
Zoffset = hdfread('C:\Users\Mampi\Dropbox\CSET\Data\CloudSAT\Geoprof_current\2015200212411_49074_CS_2B-GEOPROF_GRANULE_P_R04_E06.hdf', '/2B-GEOPROF/Swath Attributes/Radar_Reflectivity.offset', 'Fields', 'AttrValues');
Zfactor= hdfread('C:\Users\Mampi\Dropbox\CSET\Data\CloudSAT\Geoprof_current\2015200212411_49074_CS_2B-GEOPROF_GRANULE_P_R04_E06.hdf', '/2B-GEOPROF/Swath Attributes/Radar_Reflectivity.factor', 'Fields', 'AttrValues');
range = hdfread('C:\Users\Mampi\Dropbox\CSET\Data\CloudSAT\Geoprof_current\2015200212411_49074_CS_2B-GEOPROF_GRANULE_P_R04_E06.hdf', '/2B-GEOPROF/Swath Attributes/Radar_Reflectivity.valid_range', 'Fields', 'AttrValues');
range=transpose(range{1});
Zoffset=transpose(Zoffset{1});
Zfactor=transpose(Zfactor{1});
t=transpose(t{1});
valid_min=single(range(1));
valid_max=single(range(2));
valid_max = valid_max/Zfactor;
valid_min = valid_min./Zfactor;
Z = Z./Zfactor;
Z(Z>valid_max) = nan;
Z(Z<valid_min) = nan;

factor = hdfread('C:\Users\Mampi\Dropbox\CSET\Data\CloudSAT\Geoprof_current\2015200212411_49074_CS_2B-GEOPROF_GRANULE_P_R04_E06.hdf', '/2B-GEOPROF/Swath Attributes/Height.factor', 'Fields', 'AttrValues', 'FirstRecord',1 ,'NumRecords',1);
factor=factor{:};
offset = hdfread('C:\Users\Mampi\Dropbox\CSET\Data\CloudSAT\Geoprof_current\2015200212411_49074_CS_2B-GEOPROF_GRANULE_P_R04_E06.hdf', '/2B-GEOPROF/Swath Attributes/Height.offset', 'Fields', 'AttrValues', 'FirstRecord',1 ,'NumRecords',1);
offset=offset{:};
range = hdfread('C:\Users\Mampi\Dropbox\CSET\Data\CloudSAT\Geoprof_current\2015200212411_49074_CS_2B-GEOPROF_GRANULE_P_R04_E06.hdf', '/2B-GEOPROF/Swath Attributes/Height.valid_range', 'Fields', 'AttrValues', 'FirstRecord',1 ,'NumRecords',1);
range=range{:};
valid_min=single(range(1));
valid_max=single(range(2));
valid_max = valid_max/factor;
valid_min = valid_min/factor;
h= h/factor;
h(h>valid_max) = nan;
h(h<valid_min) = nan;

mask=double(mask);
factor = hdfread('C:\Users\Mampi\Dropbox\CSET\Data\CloudSAT\Geoprof_current\2015200212411_49074_CS_2B-GEOPROF_GRANULE_P_R04_E06.hdf', '/2B-GEOPROF/Swath Attributes/CPR_Cloud_mask.factor', 'Fields', 'AttrValues', 'FirstRecord',1 ,'NumRecords',1);
factor=factor{:};
offset = hdfread('C:\Users\Mampi\Dropbox\CSET\Data\CloudSAT\Geoprof_current\2015200212411_49074_CS_2B-GEOPROF_GRANULE_P_R04_E06.hdf', '/2B-GEOPROF/Swath Attributes/CPR_Cloud_mask.offset', 'Fields', 'AttrValues', 'FirstRecord',1 ,'NumRecords',1);
offset=offset{:};
range = hdfread('C:\Users\Mampi\Dropbox\CSET\Data\CloudSAT\Geoprof_current\2015200212411_49074_CS_2B-GEOPROF_GRANULE_P_R04_E06.hdf', '/2B-GEOPROF/Swath Attributes/CPR_Cloud_mask.valid_range', 'Fields', 'AttrValues', 'FirstRecord',1 ,'NumRecords',1);
range=range{:};
valid_min=single(range(1));
valid_max=single(range(2));
valid_max = valid_max/factor;
valid_min = valid_min/factor;
mask= mask/factor;
mask(mask>valid_max) = nan;
mask(mask<valid_min) = nan;

% dbz=10.*log10(double(Z));
% dbz(isinf(dbz))=NaN;
E=-146;W=-147;
E=180;W=-180;
% lat(lon>E | lon<W)=[];
mask(lon>E | lon<W,:)=[];
h(lon>E | lon<W,:)=[];
t(lon>E | lon<W,:)=[];
Z(lon>E | lon<W,:)=[];
% dbz(lon>-50 | lon<-60,:)=[];
% lon(lon>E | lon<W)=[];

lon1=NaN(20678,125);
lat1=NaN(20678,125);
for i=1:125
    lon1(:,i)=lon(i);
    lat1(:,i)=lat(i);
    t1(:,i)=t;
end

mask(h<0)=NaN;mask(mask<5)=NaN;
% h1=h;h1(h1<4000)=NaN;
mask1=mask;mask1(h>2000)=NaN;mask1(mask1>5)=NaN;
cbh=NaN(20678,1);
for i=1:20678
    ind=find(~isnan(mask1(i,:)),1,'first');
    if(any(ind)~=0)
        cbh(i,1)=h(i,ind);
    end
%     mask1(i,ind)=NaN;
%     ind=find(~isnan(mask1(i,:)),1,'last');
%     if(any(ind)~=0)
%         cbh(i,1)=h(i,ind);
%     end
end
% cbh=movmean(cbh,3);
contourf(t1,h,mask,'edgecolor','none');colorbar;colormap('jet');
ylim([0 5000]);
% hold on;plot(t,cbh,'k','LineWidth',2);
set(gca,'FontSize',16,'FontWeight','Bold');
ylabel('Altitude');

figure;
subplot(211);
contourf(t1,h,Z,'edgecolor','none');colorbar;colormap('jet');
ylim([0 5000]);
% hold on;plot(t,cbh,'k','LineWidth',2);
set(gca,'FontSize',16,'FontWeight','Bold');
ylabel('Altitude');

% figure;
subplot(212);
plot(t,lat,'b.');
set(gca,'FontSize',16,'FontWeight','Bold');
xlabel('Profile time (s)');
ylabel('Latitude');%xlim([-180 180]);