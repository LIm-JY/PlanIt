package com.aia.it.planner.model;

public class PlannerJoinDaily {

		
		private String ptitle;
	   	private String pstartdate;
	   	private String penddate;
	   	private String dloc;
		private String dloclon;
		private String dloclat;
		private String dmsg;
		private String dphoto;
		private String dtype;
		private String ddate;
		private int ddidx;
		private int pidx;
		private int uidx;
	   	private int didx;
		
		public PlannerJoinDaily() {
			
		}

		public PlannerJoinDaily(String ptitle, String pstartdate, String penddate, String dloc, String dloclon,
				String dloclat, String dmsg, String dphoto, String dtype, String ddate, int ddidx, int pidx, int uidx,
				int didx) {
			this.ptitle = ptitle;
			this.pstartdate = pstartdate;
			this.penddate = penddate;
			this.dloc = dloc;
			this.dloclon = dloclon;
			this.dloclat = dloclat;
			this.dmsg = dmsg;
			this.dphoto = dphoto;
			this.dtype = dtype;
			this.ddate = ddate;
			this.ddidx = ddidx;
			this.pidx = pidx;
			this.uidx = uidx;
			this.didx = didx;
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

		public String getDloc() {
			return dloc;
		}

		public void setDloc(String dloc) {
			this.dloc = dloc;
		}

		public String getDloclon() {
			return dloclon;
		}

		public void setDloclon(String dloclon) {
			this.dloclon = dloclon;
		}

		public String getDloclat() {
			return dloclat;
		}

		public void setDloclat(String dloclat) {
			this.dloclat = dloclat;
		}

		public String getDmsg() {
			return dmsg;
		}

		public void setDmsg(String dmsg) {
			this.dmsg = dmsg;
		}

		public String getDphoto() {
			return dphoto;
		}

		public void setDphoto(String dphoto) {
			this.dphoto = dphoto;
		}

		public String getDtype() {
			return dtype;
		}

		public void setDtype(String dtype) {
			this.dtype = dtype;
		}

		public String getDdate() {
			return ddate;
		}

		public void setDdate(String ddate) {
			this.ddate = ddate;
		}

		public int getDdidx() {
			return ddidx;
		}

		public void setDdidx(int ddidx) {
			this.ddidx = ddidx;
		}

		public int getPidx() {
			return pidx;
		}

		public void setPidx(int pidx) {
			this.pidx = pidx;
		}

		public int getUidx() {
			return uidx;
		}

		public void setUidx(int uidx) {
			this.uidx = uidx;
		}

		public int getDidx() {
			return didx;
		}

		public void setDidx(int didx) {
			this.didx = didx;
		}

		@Override
		public String toString() {
			return "PlannerJoinDaily [ptitle=" + ptitle + ", pstartdate=" + pstartdate + ", penddate=" + penddate
					+ ", dloc=" + dloc + ", dloclon=" + dloclon + ", dloclat=" + dloclat + ", dmsg=" + dmsg
					+ ", dphoto=" + dphoto + ", dtype=" + dtype + ", ddate=" + ddate + ", ddidx=" + ddidx + ", pidx="
					+ pidx + ", uidx=" + uidx + ", didx=" + didx + "]";
		}
		
		
	
	
	
	
	
	
	
}
