<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>

    <div class="container">
        <div class="row">
            <c:if test="${not empty message }">
                <div class="col-xs-12">
                    <div class="alert alert-success alert-dismissible">
                        <button type="button" class="close" data-dismiss="alert">&times;</button>
                        ${message }
                    </div>
                </div>
            </c:if>

            <div class="col-md-offset-2 col-md-8">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h4>Gerenciamento de Produtos</h4>
                    </div>
                    <div class="panel-body">
                        <!-- Form Elements -->
                        <sf:form class="form-horizontal" modelAttribute="product" action="/manage/products"
                            method="POST" enctype="multipart/form-data">
                            <div class="form-group">
                                <label class="control-label col-md-4" for="name">Insira o
                                    Nome do Produto : </label>
                                <div class="col-md-8">
                                    <sf:input type="text" path="name" id="name" placeholder="Product Name"
                                        class="form-control" />
                                    <sf:errors path="name" cssClass="help-block" element="em" />
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-md-4" for="brand">Insira a
                                    sua marca : </label>

                                <div class="col-md-8">
                                    <sf:input type="text" path="brand" id="brand" placeholder="Brand Name"
                                        class="form-control" />
                                    <sf:errors path="brand" cssClass="help-block" element="em" />
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-md-4" for="description">
                                    Descriacao do produto : </label>

                                <div class="col-md-8">
                                    <sf:textarea path="description" id="description" row="4"
                                        placeholder="Write a description of Product" class="form-control" />
                                    <sf:errors path="description" cssClass="help-block" element="em" />
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-md-4" for="unitPrice">Indique o preco de unidade:
                                </label>

                                <div class="col-md-8">
                                    <sf:input type="number" path="unitPrice" id="unitPrice" class="form-control" />
                                    <sf:errors path="unitPrice" cssClass="help-block" element="em" />

                                </div>
                            </div>


                            <div class="form-group">
                                <label class="control-label col-md-4" for="quantity">Quantidade disponivel : </label>

                                <div class="col-md-8">
                                    <sf:input type="number" path="quantity" id="quantity"
                                        placeholder="Quantity Available" class="form-control" />

                                </div>
                            </div>

                            <!-- file element for image uploading -->
                            <div class="form-group">
                                <label class="control-label col-md-4" for="file">Selecione a imagem : </label>

                                <div class="col-md-8">
                                    <sf:input type="file" path="file" id="file" class="form-control" />
                                    <sf:errors path="file" cssClass="help-block" element="em" />
                                </div>
                            </div>


                            <div class="form-group">
                                <label class="control-label col-md-4" for="categoryId">Selecione a categoria : </label>

                                <div class="col-md-8">
                                    <sf:select path="categoryId" id="categoryId" class="form-control"
                                        items="${categories }" itemLabel="name" itemValue="id" />

                                    <c:if test="${product.id == 0 }">
                                        <div class="text-right">
                                            <br>
                                            <button type="button" data-toggle="modal" data-target="#myCategoryModal"
                                                class="btn btn-warning btn-xs">Adicionar
                                                Categoria
                                            </button>
                                        </div>
                                    </c:if>

                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-md-offset-4 col-md-8">
                                    <input type="submit" name="submeter" id="submit" value="Submit"
                                        class="btn btn-primary" />
                                    <!-- All Hedden fields -->
                                    <sf:hidden path="id" />
                                    <sf:hidden path="code" />
                                    <sf:hidden path="supplierId" />
                                    <sf:hidden path="purchases" />
                                    <sf:hidden path="views" />
                                    <sf:hidden path="active" />
                                </div>
                            </div>

                        </sf:form>

                    </div>
                </div>
            </div>
        </div>


        <div class="row">
            <div class="col-xs-12">
                <h3>Produtos disponiveis</h3>
                <hr />
            </div>
            <div class="col-xs-12">
                <div class="container-fluid">
                    <div class="table-responsive">

                        <table id="adminProductsTable" class="table table-striped table-bordered">
                            <thead>
                                <tr>
                                    <th>Id</th>
                                    <th>&#160</th>
                                    <th>Nome</th>
                                    <th>Marca</th>
                                    <th>Quantidade</th>
                                    <th>Preco de Unidade</th>
                                    <th>Ativar</th>
                                    <th>Editar</th>
                                </tr>
                            </thead>

                        </table>
                    </div>
                </div>
            </div>
        </div>


        <div class="modal fade" id="myCategoryModal" role="dialog" tabindex="-1">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <!-- Modal Header -->
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">
                            <span>&times;</span>
                        </button>
                        <h4 class="modal-title">Adicionar nova categoria</h4>
                    </div>

                    <div class="modal-body">
                        <!-- Category Form -->

                        <sf:form id="categoryForm" modelAttribute="category" action="${contextRoot }/manage/category"
                            method="POST" class="form-horizontal">
                            <div class="form-group">
                                <label for="name" class="control-label col-md-4">
                                    Nome da categoria : </label>
                                <div class="col-md-8">
                                    <sf:input type="text" path="name" id="category_name" class="form-control" />
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="description" class="control-label col-md-4">
                                    Descricao da categoria : </label>
                                <div class="col-md-8">
                                    <sf:textarea cols="" rows="5" path="description" id="category_description"
                                        class="form-control" />
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-md-offset-4 col-md-8">
                                    <input type="submit" value="Add Category" class="btn btn-primary" />
                                </div>
                            </div>

                        </sf:form>

                    </div>

                </div>

            </div>

        </div>


    </div>