package com.shoppingkitten.entity;

public class Send_distribution {

        private int id;
        private int uid;
        private String province;
        private String city;
        private String county;
        private String town;
        private String township;
        private int total;

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    @Override
        public String toString() {
            return "send_distribution{" +
                    "id=" + id +
                    ", uid=" + uid +
                    ", province='" + province + '\'' +
                    ", city='" + city + '\'' +
                    ", county='" + county + '\'' +
                    ", town='" + town + '\'' +
                    ", township='" + township + '\'' +
                    '}';
        }

        public Send_distribution(int id, int uid, String province, String city, String county, String town, String township) {
            this.id = id;
            this.uid = uid;
            this.province = province;
            this.city = city;
            this.county = county;
            this.town = town;
            this.township = township;
        }

        public Send_distribution() {
            super();
        }

        public int getId() {
            return id;
        }

        public void setId(int id) {
            this.id = id;
        }

        public int getUid() {
            return uid;
        }

        public void setUid(int uid) {
            this.uid = uid;
        }

        public String getProvince() {
            return province;
        }

        public void setProvince(String province) {
            this.province = province;
        }

        public String getCity() {
            return city;
        }

        public void setCity(String city) {
            this.city = city;
        }

        public String getCounty() {
            return county;
        }

        public void setCounty(String county) {
            this.county = county;
        }

        public String getTown() {
            return town;
        }

        public void setTown(String town) {
            this.town = town;
        }

        public String getTownship() {
            return township;
        }

        public void setTownship(String township) {
            this.township = township;
        }
    }


