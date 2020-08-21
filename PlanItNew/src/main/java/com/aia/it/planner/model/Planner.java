package com.aia.it.planner.model;

public class Planner {
   
   private int pidx;
   private String ptitle;
   private String pstartdate;
   private String penddate;
   private int uidx;
   
   
   public Planner() {
   }
   
   
   public Planner(int pidx, String ptitle, String pstartdate, String penddate, int uidx) {
      this.pidx = pidx;
      this.ptitle = ptitle;
      this.pstartdate = pstartdate;
      this.penddate = penddate;
      this.uidx = uidx;
   }
   
   
   public int getPidx() {
      return pidx;
   }
   public void setPidx(int pidx) {
      this.pidx = pidx;
   }
   public String getPtitle() {
      return ptitle;
   }
   public void setPtitle(String ptitle) {
      this.ptitle = ptitle;
   }
   public String getPstartdate() {
      return pstartdate;
   }
   public void setPstartdate(String pstartdate) {
      this.pstartdate = pstartdate;
   }
   public String getPenddate() {
      return penddate;
   }
   public void setPenddate(String penddate) {
      this.penddate = penddate;
   }
   public int getUidx() {
      return uidx;
   }
   public void setUidx(int uidx) {
      this.uidx = uidx;
   }
   
   
   @Override
   public String toString() {
      return "Planner [pidx=" + pidx + ", ptitle=" + ptitle + ", pstartdate=" + pstartdate + ", penddate=" + penddate
            + ", uidx=" + uidx + "]";
   }
   
   
   
   

}