package domain;

import java.math.BigInteger;
import java.sql.Timestamp;

/**
 * Created by LiLinZhi on 17/5/25.
 */
public class UserLuckyDrawRecord {
    private BigInteger id;
    private String campaignCode;
    private String uid;
    private Integer index;
    private String templateCode;
    private String jumpUrl;
    private String offer;
    private String offerName;
    private Integer offerValue;
    private Integer offerCount;
    private Timestamp effectiveFrom;
    private Timestamp effectiveTo;
    private Timestamp createdAt;
    private Timestamp updatedAt;

    public UserLuckyDrawRecord() {
        super();
    }

    public UserLuckyDrawRecord(String campaignCode, String uid, Integer index, String templateCode, String jumpUrl,
                               String offer, String offerName, Integer offerValue, Integer offerCount,
                               Timestamp effectiveFrom, Timestamp effectiveTo) {
        this.campaignCode = campaignCode;
        this.uid = uid;
        this.index = index;
        this.templateCode = templateCode;
        this.jumpUrl = jumpUrl;
        this.offer = offer;
        this.offerName = offerName;
        this.offerValue = offerValue;
        this.offerCount = offerCount;
        this.effectiveFrom = effectiveFrom;
        this.effectiveTo = effectiveTo;
    }

    public BigInteger getId() {
        return id;
    }

    public void setId(BigInteger id) {
        this.id = id;
    }

    public String getCampaignCode() {
        return campaignCode;
    }

    public void setCampaignCode(String campaignCode) {
        this.campaignCode = campaignCode;
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public Integer getIndex() {
        return index;
    }

    public void setIndex(Integer index) {
        this.index = index;
    }

    public String getTemplateCode() {
        return templateCode;
    }

    public void setTemplateCode(String templateCode) {
        this.templateCode = templateCode;
    }

    public String getJumpUrl() {
        return jumpUrl;
    }

    public void setJumpUrl(String jumpUrl) {
        this.jumpUrl = jumpUrl;
    }

    public String getOffer() {
        return offer;
    }

    public void setOffer(String offer) {
        this.offer = offer;
    }

    public String getOfferName() {
        return offerName;
    }

    public void setOfferName(String offerName) {
        this.offerName = offerName;
    }

    public Integer getOfferValue() {
        return offerValue;
    }

    public void setOfferValue(Integer offerValue) {
        this.offerValue = offerValue;
    }

    public Integer getOfferCount() {
        return offerCount;
    }

    public void setOfferCount(Integer offerCount) {
        this.offerCount = offerCount;
    }

    public Timestamp getEffectiveFrom() {
        return effectiveFrom;
    }

    public void setEffectiveFrom(Timestamp effectiveFrom) {
        this.effectiveFrom = effectiveFrom;
    }

    public Timestamp getEffectiveTo() {
        return effectiveTo;
    }

    public void setEffectiveTo(Timestamp effectiveTo) {
        this.effectiveTo = effectiveTo;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

    public Timestamp getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Timestamp updatedAt) {
        this.updatedAt = updatedAt;
    }
}
