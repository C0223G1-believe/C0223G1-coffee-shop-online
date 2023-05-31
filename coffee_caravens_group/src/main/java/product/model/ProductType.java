package product.model;

public class ProductType {
    private int id;
    private String ProductTypeName;

    public ProductType(int id, String productTypeName) {
        this.id = id;
        ProductTypeName = productTypeName;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getProductTypeName() {
        return ProductTypeName;
    }

    public void setProductTypeName(String productTypeName) {
        ProductTypeName = productTypeName;
    }
}
